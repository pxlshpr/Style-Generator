import Foundation
import RealmSwift

class ColorObject: Object {
    
    enum MaterialColorHue {
        case P500, P50, P100, P200, P300, P400, P600, P700, P800, P900
        case A100, A200, A400, A700
    }

    dynamic var hex = ""
    
    dynamic var name: String?
    dynamic var hue: String?

	// array of MaterialColors that may be used as accents for this color    
    let accents = List<ColorObject>()
        
    //TODO: decide if we should have a stored array of relationships to other colors or if we should instead have a property of some sort that allows us to dynamically grab these from the realm we're in at any given time? what's possible? what's better?
    // array of Colors that are other hues of this same color. There may be accent colors, who knows. This is what we suspect would create a mangled web of relationships. Or something super elegant. Who knows? 🍁
    let hues = List<ColorObject>()
    
    override static func primaryKey() -> String? {
        return "hex"
    }
}

func initiateBackend() {
    
    // TODO: Get the realm browser and make sure we have it setup to observe our changes before running these! ACTUALLY, first read up on the options for browsing our Realm data and then take it from there
    let red50 = ColorObject(value: ["ffebee", "Red", "50"])
    let red100 = ColorObject(value: ["ffcdd2", "Red", "100"])
    let red200 = ColorObject(value: ["ef9a9a", "Red", "200"])
    let red300 = ColorObject(value: ["e57373", "Red", "300"])
    
    red50.hues.append(objectsIn: [red100, red200, red300])
    red100.hues.append(objectsIn: [red50, red200, red300])
    red200.hues.append(objectsIn: [red50, red100, red300])
    red300.hues.append(objectsIn: [red50, red100, red200])
    
    let realm = try! Realm()
    try! realm.write {
        realm.add(red50)
        realm.add(red100)
        realm.add(red200)
        realm.add(red300)
    }
    
}
