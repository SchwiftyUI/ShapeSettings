//
//  SettingsView.swift
//  ShapeSettings
//
//  Created by SchwiftyUI on 5/21/20.
//  Copyright © 2020 SchwiftyUI. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode)
    var presentationMode
    
    @ObservedObject
    var shapeSettings: ShapeSettings
    
    @State
    var chosenColor = 0
    
    @State
    var chosenShape = ShapeSettings.Shapes.Circle
    
    @State
    var scale = 0.5
    
    @State
    var shapeCount = 1
    
    @State
    var showShapes = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shape Settings")) {
                    Picker(selection: $chosenColor, label: Text("Color"), content: {
                        ForEach(0..<ShapeSettings.Colors.count, id: \.self) { index in
                            Text("\(ShapeSettings.Colors[index].description)")
                            .tag(index)
                        }
                    })
                    
                    Picker(selection: $chosenShape, label: Text("Shape"), content: {
                        ForEach(ShapeSettings.Shapes.allCases, id: \.self) { shape in
                            Text("\(shape.rawValue)")
                            .tag(shape)
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack {
                        Text("Size")
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                        Slider(value: $scale, in: 0...1)
                        Image(systemName: "circle.fill")
                            .imageScale(.large)
                    }
                }
                
                Section(header: Text("Other Settings")) {
                    Stepper("Count: \(shapeCount)", value: $shapeCount, in: 1...10)
                    
                    Toggle(isOn: $showShapes, label: {
                        Text("Show Shapes")
                    })
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button(action: {
                self.shapeSettings.chosenColor = self.chosenColor
                self.shapeSettings.chosenShape = self.chosenShape
                self.shapeSettings.scale = self.scale
                self.shapeSettings.shapeCount = self.shapeCount
                self.shapeSettings.showShapes = self.showShapes
                
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Dismiss")
            }))
        }
        .onAppear(perform: {
            self.chosenColor = self.shapeSettings.chosenColor
            self.chosenShape = self.shapeSettings.chosenShape
            self.scale = self.shapeSettings.scale
            self.shapeCount = self.shapeSettings.shapeCount
            self.showShapes = self.shapeSettings.showShapes
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(shapeSettings: ShapeSettings())
    }
}
