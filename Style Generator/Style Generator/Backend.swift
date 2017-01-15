import Foundation
import RealmSwift

class ColorObject: Object {
    
    enum MaterialColorHue {
        case P500, P50, P100, P200, P300, P400, P600, P700, P800, P900
        case A100, A200, A400, A700
    }

    dynamic var hex = ""
    dynamic var materialColorName = ""
    dynamic var materialColorHue = ""
    
    dynamic var materialColorAccents : [ColorObject] = [] // array of MaterialColors that may be used as accents for this color
    
    //TODO: decide if we should have a stored array of relationships to other colors or if we should instead have a property of some sort that allows us to dynamically grab these from the realm we're in at any given time? what's possible? what's better?
    
    dynamic var materialColorHues: [ColorObject] = [] // array of Colors that are other hues of this same color. There may be accent colors, who knows. This is what we suspect would create a mangled web of relationships. Or something super elegant. Who knows? 🍁
    
    override static func primaryKey() -> String? {
        return "hex"
    }
}

func initiateBackend() {
    
    let red50 = ColorObject(value: ["ffebee", "Red", ColorObject.MaterialColorHue.P50, [], []])
    let red100 = ColorObject(value: ["ffcdd2", "Red", ColorObject.MaterialColorHue.P100, [], []])
    let red200 = ColorObject(value: ["ef9a9a", "Red", ColorObject.MaterialColorHue.P200, [], []])
    let red300 = ColorObject(value: ["e57373", "Red", ColorObject.MaterialColorHue.P300, [], []])
    let red400 = ColorObject(value: ["ef5350", "Red", ColorObject.MaterialColorHue.P400, [], []])
    let red500 = ColorObject(value: ["f44336", "Red", ColorObject.MaterialColorHue.P500, [], []])
    let red600 = ColorObject(value: ["e53935", "Red", ColorObject.MaterialColorHue.P600, [], []])
    let red700 = ColorObject(value: ["d32f2f", "Red", ColorObject.MaterialColorHue.P700, [], []])
    let red800 = ColorObject(value: ["c62828", "Red", ColorObject.MaterialColorHue.P800, [], []])
    let red900 = ColorObject(value: ["b71c1c", "Red", ColorObject.MaterialColorHue.P900, [], []])
    let redA100 = ColorObject(value: ["ff8a80", "Red", ColorObject.MaterialColorHue.A100, [], []])
    let redA200 = ColorObject(value: ["ff5252", "Red", ColorObject.MaterialColorHue.A200, [], []])
    let redA400 = ColorObject(value: ["ff1744", "Red", ColorObject.MaterialColorHue.A400, [], []])
    let redA700 = ColorObject(value: ["d50000", "Red", ColorObject.MaterialColorHue.A700, [], []])
}
