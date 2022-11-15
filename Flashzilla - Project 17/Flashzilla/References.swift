//
//  References.swift
//  Flashzilla
//
//  Created by Eric Tolson on 11/9/22.
//

import Foundation

/*
 /// accessibility
 
 * reduce transparency
 
 struct ContentView: View {
     @Environment(\.accessibilityReduceTransparency) var reduceTransparency

     var body: some View {
         Text("Hello, World!")
             .padding()
             .background(reduceTransparency ? .black : .black.opacity(0.5))
             .foregroundColor(.white)
             .clipShape(Capsule())
     }
 
 * reduce motion
 import SwiftUI

 func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
     if UIAccessibility.isReduceMotionEnabled {
         return try body()
     } else {
         return try withAnimation(animation, body)
     }
 }

 struct ContentView: View {
     @State private var scale = 1.0

     var body: some View {
         Text("Hello, World!")
             .scaleEffect(scale)
             .onTapGesture {
                 withOptionalAnimation {
                     scale *= 1.5
                 }
             }
     }
 }

 *color blindness
 struct ContentView: View {
     @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

     var body: some View {
         HStack {
             if differentiateWithoutColor {
                 Image(systemName: "checkmark.circle")
             }

             Text("Success")
         }
         .padding()
         .background(differentiateWithoutColor ? .black : .green)
         .foregroundColor(.white)
         .clipShape(Capsule())
     }
 }
 
 
 /// when app goes in background
 
 struct ContentView: View {
     @Environment(\.scenePhase) var scenePhase

     var body: some View {
         Text("Hello, world!")
             .padding()
             .onChange(of: scenePhase) { newPhase in
                 if newPhase == .active {
                     print("Active")
                 } else if newPhase == .inactive {
                     print("Inactive")
                 } else if newPhase == .background {
                     print("Background")
                 }
             }
     }
 }
 
 
 ///
 
 add a timer

 struct ContentView: View {
     let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
     @State private var counter = 0

     var body: some View {
         Text("Hello, World!")
             .onReceive(timer) { time in
                 if counter == 5 {
                     timer.upstream.connect().cancel()
                 } else {
                     print("The time is now \(time)")
                 }

                 counter += 1
             }
     }
 }

 
 ///Make different shapes tapable
 
 struct ContentView: View {
     var body: some View {
         ZStack {
             /*
             Rectangle()
                 .fill(.blue)
                 .frame(width: 300, height: 300)
                 .onTapGesture {
                     print("Rectangle tapped!")
                 }
             /*
             Circle()
                 .fill(.red)
                 .frame(width: 300, height: 300)
                 .onTapGesture {
                     print("Circle tapped!")
                 }
                 .allowsHitTesting(false)
             */
             
             Circle()
                 .fill(.red)
                 .frame(width: 300, height: 300)
                 .contentShape(Rectangle())
                 .onTapGesture {
                     print("Circle tapped!")
                 }
             */
             VStack {
                 Text("Hello")
                 Spacer().frame(height: 100)
                 Text("World")
             }
             .contentShape(Rectangle())
             .onTapGesture {
                 print("VStack tapped!")
             }
         }
     }
 }
 
 /// make the phone buzz
 
 import CoreHaptics
 import SwiftUI

 struct ContentView: View {
     @State private var engine: CHHapticEngine?

     var body: some View {
         Text("Hello, World!")
             .onAppear(perform: prepareHaptics)
             .onTapGesture(perform: complexSuccess)
     }
     
     func simpleSuccess() {
         let generator = UINotificationFeedbackGenerator()
         generator.notificationOccurred(.success)
     }
     
     func prepareHaptics() {
         guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

         do {
             engine = try CHHapticEngine()
             try engine?.start()
         } catch {
             print("There was an error creating the engine: \(error.localizedDescription)")
         }
     }
     
     func complexSuccess() {
         // make sure that the device supports haptics
         guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
         var events = [CHHapticEvent]()

         // create several taps, increasing and then decreasing intensity
         for i in stride(from: 0, to: 1, by: 0.1) {
             let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
             let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
             let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
             events.append(event)
         }

         for i in stride(from: 0, to: 1, by: 0.1) {
             let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
             let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
             let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
             events.append(event)
         }

         // convert those events into a pattern and play it immediately
         do {
             let pattern = try CHHapticPattern(events: events, parameters: [])
             let player = try engine?.makePlayer(with: pattern)
             try player?.start(atTime: 0)
         } catch {
             print("Failed to play pattern: \(error.localizedDescription).")
         }
     }
 }
 
 /// way too much stuff about gestures
 
 struct ContentView: View {
     /*
     @State private var currentAmount = Angle.zero
     @State private var finalAmount = Angle.zero
     */
     // how far the circle has been dragged
         @State private var offset = CGSize.zero

         // whether it is currently being dragged or not
         @State private var isDragging = false


     var body: some View {
         /*
         VStack {
             Text("Hello, World!")
                 .onTapGesture(count: 2) {
                     print("Double tapped!")
                 }
             
             Text("Hello, World!")
                 .onLongPressGesture {
                     print("Long pressed!")
                 }
             
             Text("Hello, World!")
                 .onLongPressGesture(minimumDuration: 2) {
                     print("Long pressed!")
                 }
             
             Text("Hello, World!")
                 .onLongPressGesture(minimumDuration: 1) {
                     print("Long pressed!")
                 } onPressingChanged: { inProgress in
                     print("In progress: \(inProgress)!")
                 }
             
             Text("Hello, World!")
                         .scaleEffect(finalAmount + currentAmount)
                         .gesture(
                             MagnificationGesture()
                                 .onChanged { amount in
                                     currentAmount = amount - 1
                                 }
                                 .onEnded { amount in
                                     finalAmount += currentAmount
                                     currentAmount = 0
                                 }
                         )

         Text("Hello, World!")
                     .rotationEffect(currentAmount + finalAmount)
                     .gesture(
                         RotationGesture()
                             .onChanged { angle in
                                 currentAmount = angle
                             }
                             .onEnded { angle in
                                 finalAmount += currentAmount
                                 currentAmount = .zero
                             }
                     )
         */
         //}
         /*
         VStack {
                     Text("Hello, World!")
                         .onTapGesture {
                             print("Text tapped")
                         }
                 }
                 .onTapGesture {
                     print("VStack tapped")
                 }
         */
         /*
         VStack {
                     Text("Hello, World!")
                         .onTapGesture {
                             print("Text tapped")
                         }
                 }
                 .highPriorityGesture(
                     TapGesture()
                         .onEnded { _ in
                             print("VStack tapped")
                         }
                 )
         
         VStack {
                     Text("Hello, World!")
                         .onTapGesture {
                             print("Text tapped")
                         }
                 }
                 .simultaneousGesture(
                     TapGesture()
                         .onEnded { _ in
                             print("VStack tapped")
                         }
                 )
         */
         
         let dragGesture = DragGesture()
                     .onChanged { value in offset = value.translation }
                     .onEnded { _ in
                         withAnimation {
                             offset = .zero
                             isDragging = false
                         }
                     }

                 // a long press gesture that enables isDragging
                 let pressGesture = LongPressGesture()
                     .onEnded { value in
                         withAnimation {
                             isDragging = true
                         }
                     }

                 // a combined gesture that forces the user to long press then drag
                 let combined = pressGesture.sequenced(before: dragGesture)

                 // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
                 Circle()
                     .fill(.red)
                     .frame(width: 64, height: 64)
                     .scaleEffect(isDragging ? 1.5 : 1)
                     .offset(offset)
                     .gesture(combined)
         
     }
 }

 */
