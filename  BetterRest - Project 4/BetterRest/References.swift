//
//  References.swift
//  BetterRest
//
//  Created by Eric Tolson on 10/14/22.
//

import Foundation
 /*
///stepper
  
  struct ContentView: View {
      @State private var sleepAmount = 8.0

      var body: some View {
          Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
      }
  }
  
  /// date pickers
  
  struct ContentView: View {
      @State private var wakeUp = Date.now
      
      var body: some View {
          VStack {
              DatePicker("Please enter a date", selection: $wakeUp)
                  .labelsHidden()
              
              DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
              
              DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
          }

      }
      
      func exampleDates() {
          // create a second Date instance set to one day in seconds from now
          let tomorrow = Date.now.addingTimeInterval(86400)

          // create a range from those two
          let range = Date.now...tomorrow
      }
  }

  ///date components and formatting
  
  struct ContentView: View {
      
      
      var body: some View {
          VStack {
              Text(Date.now, format: .dateTime.hour().minute())
              Text(Date.now, format: .dateTime.day().month().year())
              Text(Date.now.formatted(date: .long, time: .shortened))

          }
      }
      
      func trivial() {
          let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
          let hour = components.hour ?? 0
          let minute = components.minute ?? 0
          /*
          var components = DateComponents()
          components.hour = 8
          components.minute = 0
          let date = Calendar.current.date(from: components)
           */
          }
  }
  
  
  
  /// WHOLE APP
  
  import CoreML
  import SwiftUI

  struct ContentView: View {
      @State private var wakeUp = defaultWakeTime
      @State private var sleepAmount = 8.0
      @State private var coffeeAmount = 1
      
      @State private var alertTitle = ""
      @State private var alertMessage = ""
      @State private var showingAlert = false
      
      static var defaultWakeTime: Date {
          var components = DateComponents()
          components.hour = 7
          components.minute = 0
          return Calendar.current.date(from: components) ?? Date.now
      }
      
      var sleepResults: String {
          do {
              let config = MLModelConfiguration()
              let model = try SleepCalculator(configuration: config)
              
              let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
              let hour = (components.hour ?? 0) * 60 * 60
              let minute = (components.minute ?? 0) * 60
              
              let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
              
              let sleepTime = wakeUp - prediction.actualSleep
              
              return "Your ideal bedtime is " + sleepTime.formatted(date: .omitted, time: .shortened)

              
          } catch {
              return "There was an error"
          }
          
      }
      
      var body: some View {
          NavigationView {
              Form {
                  Section {
                      DatePicker("Please enter a time", selection: $wakeUp, displayedComponents:
                              .hourAndMinute)
                      .labelsHidden()
                  }  header: {
                      Text("When do you want to wake up?")
                      .font(.headline)
                      
                  }
                  
                  Section {
                      
                      Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                  } header: {
                      Text("Desired amount of sleep")
                          .font(.headline)
                  }
                  
                  Section {
                      Picker("Number of cups" ,selection: $coffeeAmount) {
                          ForEach(1..<21) {
                              Text(String($0))
                          }
                      }
                  } header: {
                      Text("Daily coffee intake")
                          .font(.headline)
                  }
                  Text(sleepResults)
                      .font(.title3)
              }
          
              .navigationTitle("BetterRest")
              
          }
          
      }
      
      
      func calculateBedtime() {
          do {
              let config = MLModelConfiguration()
              let model = try SleepCalculator(configuration: config)
              
              let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
              let hour = (components.hour ?? 0) * 60 * 60
              let minute = (components.minute ?? 0) * 60
              
              let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
              
              let sleepTime = wakeUp - prediction.actualSleep
              
              alertTitle = "Your ideal bedtime is…"
              alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
              
          } catch {
              alertTitle = "Error"
              alertMessage = "Sorry, there was a problem calculating your bedtime."
          }
          
          showingAlert = true

      }
  }

  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView()
      }
  }

  */
