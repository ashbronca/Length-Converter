//
//  ContentView.swift
//  Length Converter
//
//  Created by Ash Bronca on 29/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var outputText = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    let units = ["inches", "feet", "miles", "cm", "meters", "kM"]
    let convertToCm = [2.54, 30.48, 160934, 1, 100, 100000]

    var finalNumber: Double {

        // get inputText into a Double
        let inputNumber = Double(inputText) ?? 1

        // declare the unit of input
        let inputUnitSelected = Double(convertToCm[inputUnit])

        // multiply down to cmUnit
        let cmUnit = inputNumber * inputUnitSelected

        // declare the unit of output
        let outputUnitSelection = Double(convertToCm[outputUnit])

        // multiply up to newNumber
        let newNumber = cmUnit / outputUnitSelection

        return newNumber
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Your Number To Convert", text: $inputText)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Your convered number")) {
                    if finalNumber > 10 {
                        Text("\(finalNumber, specifier: "%.2f")")
                    } else {
                        Text("\(finalNumber)")
                    }

                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

            }
            .navigationBarTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
