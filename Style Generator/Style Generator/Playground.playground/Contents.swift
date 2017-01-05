//: Playground - noun: a place where people can play

import UIKit

let red = UIColor.red

if let components = red.cgColor.components {
    let red = components[0] * 255.0
    let green = components[1] * 255.0
    let blue = components[2] * 255.0
    let alpha = components[3]
}

let validHex = "FFFFFF"
let invalidHex = "ASMX@S"

var int = UInt32()
let bool = Scanner(string: "ASMX@S").scanHexInt32(&int)

//let bool2 = validHex.isValidHexNumber()
