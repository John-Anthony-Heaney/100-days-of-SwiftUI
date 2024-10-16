//
//  ContentView.swift
//  UnitCoversion
//
//  Created by John Anthony Heaney on 16/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var baseValue = 0.0
    @State private var baseUnit = "Meter"
    @State private var convertUnit = "Meter"
    
    let units = ["Meter","Feet","Inch","CM","Mile","KM"]
    
    
    var toMeter: Double {
        
        switch baseUnit {
        case "Feet":
            return baseValue * 0.3048
        case "Inch":
            return baseValue * 0.0254
        case "CM":
            return baseValue * 0.01
        case "Mile":
            return baseValue * 1609.34
        case "KM":
            return baseValue * 1000
        default:
            return baseValue
        }
    }
    
    var fromMeter: Double {
        
        switch convertUnit {
        case "Feet":
            return toMeter * 3.28084
        case "Inch":
            return toMeter * 39.3701
        case "CM":
            return toMeter * 100
        case "Mile":
            return toMeter * 0.000539957
        case "KM":
            return toMeter * 0.001
        default:
            return toMeter
        }
    }
        
    var body: some View {
        NavigationStack {
            Form {
                Section("Starting amount") {
                    TextField("Amount", value: $baseValue, formatter: NumberFormatter())
                    
                    Picker("Base unit", selection: $baseUnit){
                        ForEach(units, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    
                    Picker("Resulting unit", selection: $convertUnit){
                        ForEach(units, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                }
                
                
                Section("Result") {
                    Text(fromMeter, format: .number)
                }
            }
            .navigationTitle("Unit Converstion App")
        }
    }
}

#Preview {
    ContentView()
}
