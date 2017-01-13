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

struct MaterialColor: Color {
    var name: String
    var barStyle: UIBarStyle
    var uiColor: UIColor {
        get {
            return UIColor(hexString: hex)
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
    
    static var red = MaterialColor(name: "Red", hex: "#F44336")
    static var pink = MaterialColor(name: "Pink", hex: "#E91E63")
    static var purple = MaterialColor(name: "Purple", hex: "#9C27B0")
    static var deepPurple = MaterialColor(name: "Deep Purple", hex: "#673AB7")
    static var indigo = MaterialColor(name: "Indigo", hex: "#3F51B5")
    static var blue = MaterialColor(name: "Blue", hex: "#2196F3")
    static var lightBlue = MaterialColor(name: "Light Blue", hex: "#03A9F4")
    static var cyan = MaterialColor(name: "Cyan", hex: "#00BCD4")
    static var teal = MaterialColor(name: "Teal", hex: "#009688")
    static var green = MaterialColor(name: "Green", hex: "#4CAF50")
    static var lightGreen = MaterialColor(name: "Light Green", hex: "#8BC34A", barStyle: .default)
    static var lime = MaterialColor(name: "Lime", hex: "#CDDC39", barStyle: .default)
    static var yellow = MaterialColor(name: "Yellow", hex: "#FFEB3B", barStyle: .default)
    static var amber = MaterialColor(name: "Amber", hex: "#FFC107", barStyle: .default)
    static var orange = MaterialColor(name: "Orange", hex: "#FF9800")
    static var deepOrange = MaterialColor(name: "Deep Orange", hex: "#FF5722")
    static var brown = MaterialColor(name: "Brown", hex: "#795548")
    static var grey = MaterialColor(name: "Grey", hex: "#9E9E9E")
    static var blueGrey = MaterialColor(name: "Blue Grey", hex: "#607D8B")
    
    static let primaryColors = [
        MaterialColor.red,
        MaterialColor.pink,
        MaterialColor.purple,
        MaterialColor.deepPurple,
        MaterialColor.indigo,
        MaterialColor.blue,
        MaterialColor.lightBlue,
        MaterialColor.cyan,
        MaterialColor.teal,
        MaterialColor.green,
        MaterialColor.lightGreen,
        MaterialColor.lime,
        MaterialColor.yellow,
        MaterialColor.amber,
        MaterialColor.orange,
        MaterialColor.deepOrange,
        MaterialColor.brown,
        MaterialColor.grey,
        MaterialColor.blueGrey
    ]

}

