//
//  ContentView.swift
//  BetterRest
//
//  Created by John Anthony Heaney on 18/10/2024.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var bedtime: String {
        return calculateBedtime()
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    
                    
                    Text(bedtime)
                    
                }
            
                Section("When do you want to wake up?"){
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .font(.headline)
                
                Section("Desired amount of sleep") {
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in:
                                4...12, step: 0.25)
                }
                .font(.headline)
                
                Section("Daily coffee intake") {
                    
                    
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1..<21) { number in
                            Text("\(number-1)")
                        }
                    }
                    
                }
                .font(.headline)
            }
        }
    }
    
    func calculateBedtime() -> String {
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = ( components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let alertMessage = "Your ideal bedtime is..." + sleepTime.formatted(date: .omitted, time: .shortened)
            
            return alertMessage
        } catch {
            let alertMessage = "Sorry, there was a problem calculating your bedtime."
            return alertMessage
        }
    }
}

#Preview {
    ContentView()
}
