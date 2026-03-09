//
//  ContentView.swift
//  UnitConversions
//
//  Created by Soban Shoaib on 2026-03-08.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectTempInput = "Celsius"
    @State var selectTempOutput = "Celsius"
    @State var inputTemp = 0.0
    @State var outputTemp = 0.0
    
    let tempOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var tempCalculation: Double {
        let input = Double(inputTemp)
        var val: Double = 0
        var result: Double = 0
        
        //input to kelvin
        if selectTempInput == "Celsius" {
            val = input + 273.15
        } else if selectTempInput == "Fahrenheit" {
            val = (input - 32) * (5.0/9.0) + 273.15
        } else if selectTempInput == "Kelvin" {
            val = input
        }
        
        //kelvin to output
        if selectTempOutput == "Celsius" {
            result = val - 273.15
        } else if selectTempOutput == "Fahrenheit" {
            result = (val - 273.15) * (9.0/5.0) + 32
        } else if selectTempOutput == "Kelvin" {
            result = val
        }
        
        return result
    }
    
    var body: some View {
        Form {
            Section ("Temperature") {
                HStack {
                    HStack {
                        Picker("", selection: $selectTempInput) {
                            ForEach(tempOptions, id:\.self) { temp in
                                Text(temp)
                            }
                        }
                        .frame(width: 100)
                        TextField("0", value: $inputTemp, format: .number)
                    }
                    HStack {
                        Picker("", selection: $selectTempOutput) {
                            ForEach(tempOptions, id:\.self) { temp in
                                Text(temp)
                            }
                        }
                        .frame(width: 100)
                        Text(tempCalculation, format: .number)
                    }
                    
                }
            }
            
            Section ("Length") {
                
            }
            
            Section ("Time") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
