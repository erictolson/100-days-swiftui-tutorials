//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Eric Tolson on 11/7/22.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    let filter: FilterType
    
    @State private var isShowingScanner = false
    @State private var showingConfirmation = false
    @State private var byName = false
    @State private var byTime = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredProspects) { prospect in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(prospect.name)
                                    .font(.headline)
                                if prospect.isContacted {
                                    Text("✅")
                                }
                            }
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        .swipeActions {
                            if prospect.isContacted {
                                Button {
                                    prospects.toggle(prospect)
                                } label: {
                                    Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                                }
                                .tint(.blue)
                            } else {
                                Button {
                                    prospects.toggle(prospect)
                                } label: {
                                    Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                                }
                                .tint(.green)
                                
                                Button {
                                    addNotification(for: prospect)
                                } label: {
                                    Label("Remind Me", systemImage: "bell")
                                }
                                .tint(.orange)
                            }
                        }
                        
                    }
                }
                Button {
                    showingConfirmation = true
                } label: {
                    Text("Sort Prospects")
                }
                .padding()
                .confirmationDialog("Sort Prospects", isPresented: $showingConfirmation) {
                    Button("By Name") {
                        byTime = false
                        byName = true }
                    Button("Most Recent") {
                        byName = false
                        byTime = true }
                } message: {
                    Text("Sort Method")
                }
            }
                .navigationTitle(title)
                .toolbar {
                    Button {
                        isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Alvin Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
        
    }
    
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
            //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            if byName {
                return prospects.people.sorted()
            } else if byTime {
                return prospects.people.reversed()
            }
            else {
                return prospects.people
            }
        case .contacted:
            if byName {
                return prospects.people.filter { $0.isContacted }.sorted()
            } else if byTime {
                return prospects.people.filter { $0.isContacted }.reversed()
            }
            else {
                return prospects.people.filter { $0.isContacted }
            }
        case .uncontacted:
            if byName {
                return prospects.people.filter { !$0.isContacted }.sorted()
            } else if byTime {
                return prospects.people.filter { !$0.isContacted }.reversed()
            }
            else {
                return prospects.people.filter { !$0.isContacted }
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]

            prospects.add(person)
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
