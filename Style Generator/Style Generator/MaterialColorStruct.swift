import UIKit

protocol Color: Equatable {
    var name: String { get }
    var uiColor: UIColor { get }
    var barStyle: UIBarStyle { get }
}

func ==<T: Color>(lhs: T, rhs: T) -> Bool {
    return lhs.name == rhs.name &&
        rhs.uiColor == lhs.uiColor &&
        lhs.barStyle == rhs.barStyle
}

struct MaterialColorStruct: Color {
    var name: String
    var barStyle: UIBarStyle
    var uiColor: UIColor {
        get {
          //TODO: rethink this as UIColor is nil now
          return UIColor(hexString: hex) ?? UIColor.white
        }
    }

    var hex: String

    init(name: String, hex: String) {
        self.init(name: name, hex: hex, barStyle: .black)
    }
    
    init(name: String, hex: String, barStyle: UIBarStyle) {
        self.name = name
        self.hex = hex
        self.barStyle = barStyle
    }
    
    static var red = MaterialColorStruct(name: "Red", hex: "#F44336")
    static var pink = MaterialColorStruct(name: "Pink", hex: "#E91E63")
    static var purple = MaterialColorStruct(name: "Purple", hex: "#9C27B0")
    static var deepPurple = MaterialColorStruct(name: "Deep Purple", hex: "#673AB7")
    static var indigo = MaterialColorStruct(name: "Indigo", hex: "#3F51B5")
    static var blue = MaterialColorStruct(name: "Blue", hex: "#2196F3")
    static var lightBlue = MaterialColorStruct(name: "Light Blue", hex: "#03A9F4")
    static var cyan = MaterialColorStruct(name: "Cyan", hex: "#00BCD4")
    static var teal = MaterialColorStruct(name: "Teal", hex: "#009688")
    static var green = MaterialColorStruct(name: "Green", hex: "#4CAF50")
    static var lightGreen = MaterialColorStruct(name: "Light Green", hex: "#8BC34A", barStyle: .default)
    static var lime = MaterialColorStruct(name: "Lime", hex: "#CDDC39", barStyle: .default)
    static var yellow = MaterialColorStruct(name: "Yellow", hex: "#FFEB3B", barStyle: .default)
    static var amber = MaterialColorStruct(name: "Amber", hex: "#FFC107", barStyle: .default)
    static var orange = MaterialColorStruct(name: "Orange", hex: "#FF9800")
    static var deepOrange = MaterialColorStruct(name: "Deep Orange", hex: "#FF5722")
    static var brown = MaterialColorStruct(name: "Brown", hex: "#795548")
    static var grey = MaterialColorStruct(name: "Grey", hex: "#9E9E9E")
    static var blueGrey = MaterialColorStruct(name: "Blue Grey", hex: "#607D8B")
    
    static let primaryColors = [
        MaterialColorStruct.red,
        MaterialColorStruct.pink,
        MaterialColorStruct.purple,
        MaterialColorStruct.deepPurple,
        MaterialColorStruct.indigo,
        MaterialColorStruct.blue,
        MaterialColorStruct.lightBlue,
        MaterialColorStruct.cyan,
        MaterialColorStruct.teal,
        MaterialColorStruct.green,
        MaterialColorStruct.lightGreen,
        MaterialColorStruct.lime,
        MaterialColorStruct.yellow,
        MaterialColorStruct.amber,
        MaterialColorStruct.orange,
        MaterialColorStruct.deepOrange,
        MaterialColorStruct.brown,
        MaterialColorStruct.grey,
        MaterialColorStruct.blueGrey
    ]

}

