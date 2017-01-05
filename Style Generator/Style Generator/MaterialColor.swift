//
//  MaterialColor.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 2/1/17.
//  Copyright © 2017 Ahmed Khalaf. All rights reserved.
//

import Foundation
import UIKit

struct MaterialColor {
    var name: String
    var hex: String
    var barStyle: UIBarStyle
    
    init(name: String, hex: String) {
        self.init(name: name, hex: hex, barStyle: .black)
    }
    
    init(name: String, hex: String, barStyle: UIBarStyle) {
        self.name = name
        self.hex = hex
        self.barStyle = barStyle
    }
    
    static var red = MaterialColor(name: "Red", hex: "#F44336")
}

class MaterialColor2: UIColor {
    var name: String = ""
    var hex: String = ""

}

let MaterialColors = [
    MaterialColor(name: "Red", hex: "#F44336"),
    MaterialColor(name: "Pink", hex: "#E91E63"),
    MaterialColor(name: "Purple", hex: "#9C27B0"),
    MaterialColor(name: "Deep Purple", hex: "#673AB7"),
    MaterialColor(name: "Indigo", hex: "#3F51B5"),
    MaterialColor(name: "Blue", hex: "#2196F3"),
    MaterialColor(name: "Light Blue", hex: "#03A9F4"),
    MaterialColor(name: "Cyan", hex: "#00BCD4"),
    MaterialColor(name: "Teal", hex: "#009688"),
    MaterialColor(name: "Green", hex: "#4CAF50"),
    MaterialColor(name: "Light Green", hex: "#8BC34A"),
    MaterialColor(name: "Lime", hex: "#CDDC39"),
    MaterialColor(name: "Yellow", hex: "#FFEB3B", barStyle: .default),
    MaterialColor(name: "Amber", hex: "#FFC107"),
    MaterialColor(name: "Orange", hex: "#FF9800"),
    MaterialColor(name: "Deep Orange", hex: "#FF5722"),
    MaterialColor(name: "Brown", hex: "#795548"),
    MaterialColor(name: "Grey", hex: "#9E9E9E"),
    MaterialColor(name: "Blue Grey", hex: "#607D8B")
]
