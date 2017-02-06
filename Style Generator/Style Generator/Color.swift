import Foundation
import RealmSwift
import Toolbelt

struct Keys {
  struct Color {
    static let hex = "hex"
    static let name = "name"
    static let accents = "accents"
    static let hue = "hue"
    static let internalHue = "privateHue"
    static let hues = "hues"
  }
}

enum Hue: String {
  case P50, P100, P200, P300, P400, P500, P600, P700, P800, P900, A100, A200, A400, A700
}

class Color: Object {
  
  
  private dynamic var privateHex: String?
  var hex: String? {
    get {
      return privateHex
    }
    set {
      if let isValid = newValue?.isValidHexadecimal, isValid {
        privateHex = newValue
      } else {
        privateHex = nil
      }
    }
  }
  
  dynamic var name: String?
  
  //Workouround to storing enum in Realm
  //http://stackoverflow.com/a/33480806
  private dynamic var privateHue: String?
  var hue: Hue? {
    get {
      return privateHue != nil ? Hue(rawValue: privateHue!) : nil
    }
    set {
      if let unwrapped = newValue {
        privateHue = unwrapped.rawValue
      }
    }
  }

  let accents = List<Color>()
  let hues = List<Color>()

  override static func primaryKey() -> String? {
    return Keys.Color.hex
  }
}

//MARK: Class Functions

extension Color {
  class func addColor(withName name: String, hexes: [String]) {
    
    var index = 0
    var colors = [Color]()
    for hue in enumIterator(Hue.self) {
      guard index < hexes.count else {
        break
      }
      
      let color = Color()
      color.hex = hexes[index]
      color.hue = hue
      index += 1
      colors.append(color)
    }
    
    for color in colors {
      let realm = try! Realm()
      try! realm.write {
        color.hues.append(objectsIn: colors.filter { $0 != color })
        realm.add(color)
      }
    }
  }
}

//TODO: decide where we'll be putting these as a general rule
let insertionCompletedNotification = Notification.Name(rawValue:"InsertionCompletedNotification")
