//
//  ShapeView.swift
//  ShapeSettings
//
//  Created by SchwiftyUI on 5/21/20.
//  Copyright © 2020 SchwiftyUI. All rights reserved.
//

import SwiftUI

struct ShapeView: View {
    @ObservedObject
    var shapeSetings = ShapeSettings()
    
    var body: some View {
        NavigationView {
            VStack {
                if shapeSetings.showShapes {
                    ForEach(0..<shapeSetings.shapeCount, id: \.self) { _ in
                        InnerShape(chosenShape: self.shapeSetings.chosenShape)
                            .scale(CGFloat(self.shapeSetings.scale))
                            .foregroundColor(ShapeSettings.Colors[self.shapeSetings.chosenColor])
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.shapeSetings.showSettings = true
            }, label: {
                Text("Settings")
            }))
                .sheet(isPresented: $shapeSetings.showSettings, content: {
                    SettingsView(shapeSettings: self.shapeSetings)
            })
        }
    }
}

struct InnerShape: Shape {
    var chosenShape: ShapeSettings.Shapes
    
    func path(in rect: CGRect) -> Path {
        switch chosenShape {
        case .Circle:
            return Circle().path(in: rect)
        default:
            return Rectangle().path(in: rect)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
