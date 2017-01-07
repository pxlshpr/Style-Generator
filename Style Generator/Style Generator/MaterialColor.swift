//
//  MaterialColorStruct.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 2/1/17.
//  Copyright © 2017 Ahmed Khalaf. All rights reserved.
//

import Foundation
import UIKit

struct MaterialColor {
    var name: String = "White"
    var hex: String = "FFFFFF"
    var barStyle: UIBarStyle = .black
    var uiColor: UIColor = UIColor.white
    
    init(name: String, hex: String) {
        self.init(name: name, hex: hex, barStyle: .black)
    }
    
    init(name: String, hex: String, barStyle: UIBarStyle) {
        self.name = name
        self.hex = hex
        self.barStyle = barStyle
    }
    
    static var red = MaterialColor(name: "Red", hex: "#F44336")
}

let MaterialColors = [
    MaterialColorStruct(name: "Red", hex: "#F44336"),
    MaterialColorStruct(name: "Pink", hex: "#E91E63"),
    MaterialColorStruct(name: "Purple", hex: "#9C27B0"),
    MaterialColorStruct(name: "Deep Purple", hex: "#673AB7"),
    MaterialColorStruct(name: "Indigo", hex: "#3F51B5"),
    MaterialColorStruct(name: "Blue", hex: "#2196F3"),
    MaterialColorStruct(name: "Light Blue", hex: "#03A9F4"),
    MaterialColorStruct(name: "Cyan", hex: "#00BCD4"),
    MaterialColorStruct(name: "Teal", hex: "#009688"),
    MaterialColorStruct(name: "Green", hex: "#4CAF50"),
    MaterialColorStruct(name: "Light Green", hex: "#8BC34A"),
    MaterialColorStruct(name: "Lime", hex: "#CDDC39"),
    MaterialColorStruct(name: "Yellow", hex: "#FFEB3B", barStyle: .default),
    MaterialColorStruct(name: "Amber", hex: "#FFC107"),
    MaterialColorStruct(name: "Orange", hex: "#FF9800"),
    MaterialColorStruct(name: "Deep Orange", hex: "#FF5722"),
    MaterialColorStruct(name: "Brown", hex: "#795548"),
    MaterialColorStruct(name: "Grey", hex: "#9E9E9E"),
    MaterialColorStruct(name: "Blue Grey", hex: "#607D8B")
]
