//
//  ContentView.swift
//  UnitConversions
//
//  Created by Soban Shoaib on 2026-03-08.
//

import SwiftUI

struct ContentView: View {
    
    //temp
    @State var selectTempInput = "Celsius"
    @State var selectTempOutput = "Celsius"
    @State var inputTemp = 0.0
    let tempOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    //length
    @State var selectLengthInput = "Meters"
    @State var selectLengthOutput = "Meters"
    @State var inputLength = 0.0
    let lengthOptions = ["Meters", "Kilometers", "Miles"]
    
    //time
    @State var selectTimeInput = "Seconds"
    @State var selectTimeOutput = "Seconds"
    @State var inputTime = 0.0
    let timeOptions = ["Seconds", "Minutes", "Hours"]
    
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
    
    var lengthCalculation: Double {
        let input = Double(inputLength)
        var val: Double = 0
        var result: Double = 0
        
        //input to meters
        if selectLengthInput == "Meters" {
            val = input
        } else if selectLengthInput == "Kilometers" {
            val = input * 1000
        } else if selectLengthInput == "Miles" {
            val = input * 1609.34
        }
        
        //meters to output
        if selectLengthOutput == "Meters" {
            result = val
        } else if selectLengthOutput == "Kilometers" {
            result = val / 1000
        } else if selectLengthOutput == "Miles" {
            result = val / 1609.34
        }
        
        return result
    }
    
    var timeCalculation: Double {
        let input = Double(inputTime)
        var val: Double = 0
        var result: Double = 0
        
        //input to seconds
        if selectTimeInput == "Seconds" {
            val = input
        } else if selectTimeInput == "Minutes" {
            val = input * 60
        } else if selectTimeInput == "Hours" {
            val = input * 3600
        }
        
        //seconds to output
        if selectTimeOutput == "Seconds" {
            result = val
        } else if selectTimeOutput == "Minutes" {
            result = val / 60
        } else if selectTimeOutput == "Hours" {
            result = val / 3600
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
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
                    HStack {
                        HStack {
                            Picker("", selection: $selectLengthInput) {
                                ForEach(lengthOptions, id:\.self) { length in
                                    Text(length)
                                }
                            }
                            .frame(width: 100)
                            TextField("0", value: $inputLength, format: .number)
                        }
                        HStack {
                            Picker("", selection: $selectLengthOutput) {
                                ForEach(lengthOptions, id:\.self) { length in
                                    Text(length)
                                }
                            }
                            .frame(width: 100)
                            Text(lengthCalculation, format: .number)
                        }
                        
                    }
                }
                
                Section ("Time") {
                    HStack {
                        HStack {
                            Picker("", selection: $selectTimeInput) {
                                ForEach(timeOptions, id:\.self) { time in
                                    Text(time)
                                }
                            }
                            .frame(width: 100)
                            TextField("0", value: $inputTime, format: .number)
                        }
                        HStack {
                            Picker("", selection: $selectTimeOutput) {
                                ForEach(timeOptions, id:\.self) { time in
                                    Text(time)
                                }
                            }
                            .frame(width: 100)
                            Text(timeCalculation, format: .number)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
