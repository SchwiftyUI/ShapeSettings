//
//  ShapeSettings.swift
//  ShapeSettings
//
//  Created by SchwiftyUI on 5/21/20.
//  Copyright © 2020 SchwiftyUI. All rights reserved.
//

import Foundation
import SwiftUI

class ShapeSettings: ObservableObject {
    @Published
    var showSettings = false
    
    static var Colors = [Color.red, Color.blue, Color.green, Color.purple, Color.orange]
    
    @Published
    var chosenColor = 0
    
    enum Shapes: String, CaseIterable {
        case Circle, Rectangle
    }
    
    @Published
    var chosenShape = Shapes.Circle
    
    @Published
    var scale = 0.5
    
    @Published
    var shapeCount = 1
    
    @Published
    var showShapes = true
}
