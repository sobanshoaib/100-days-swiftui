//
//  ContentView.swift
//  WeSplit
//
//  Created by Soban Shoaib on 2026-03-05.
//

import SwiftUI

struct ContentView: View { 
    @State var costCheque = 0.0
    @State var numPeople = 2
    @State var tipAmount = 20
    @State var zeroTipSelected = false
    @FocusState private var amountFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numPeople)
        let tipSelection = Double(tipAmount)
        
        
        let tipValue = costCheque / 100 * tipSelection
        let grandTotal = costCheque + tipValue
        let amountPerson = grandTotal / peopleCount
        
        return amountPerson
    }
    
    var totalAfterTip: Double {
        
        let tipSelection = Double(tipAmount)
        let tipValue = costCheque / 100 * tipSelection
        let grandTotal = costCheque + tipValue
        
        return grandTotal
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $costCheque, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                    
                    Picker("Number of people", selection: $numPeople) {
                        ForEach(0..<100) { num in
                            Text("\(num) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("How much tip do you want to leave") {
                    Picker("Tip percentage", selection: $tipAmount) {
                        ForEach(tipPercentages, id: \.self) { tip in
                            Text(tip, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                
                Section ("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total amount before dividing") {
                    Text(totalAfterTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .background(tipAmount == 0 ? .red : .white)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountFocused {
                    Button("Done") {
                        amountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
