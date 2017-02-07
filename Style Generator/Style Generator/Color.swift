import Foundation
import RealmSwift
import Toolbelt
import UIKit

//TODO: Move this to Toolbelt
//modified from: http://stackoverflow.com/a/29044899
//which is originally derived from: https://www.w3.org/WAI/ER/WD-AERT/#color-contrast
extension UIColor {
  func isLight() -> Bool {
    guard let components = self.cgColor.components else {
      return false
    }
    
    let componentColorR: CGFloat = components[0] * 299
    let componentColorG: CGFloat = components[1] * 587
    let componentColorB: CGFloat = components[2] * 114
    
    let brightness = componentColorR + componentColorG + componentColorB
    return brightness >= 500 //try up to 700 too
  }
}

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
  case P50, P100, P200, P300, P400, P500, P600, P700, P800, P900, A100, A200, A400, A700, None
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

  var uiColor: UIColor? {
    guard let hex = hex else { return nil }
    return UIColor(hexString: hex)
  }
  
  var barStyle: UIBarStyle? {
    guard let hex = hex else { return nil }
    //TODO use code to try figure out what UIBarStyle to use on this color
    return UIBarStyle.black
  }
  
  override static func primaryKey() -> String? {
    return Keys.Color.hex
  }
  
  //safer to use these
  class func withHex(_ hex: String, name: String, hue: Hue, accents: [Color]?, hues: [Color]?) -> Color? {
    let color = Color()
    color.hex = hex
    guard color.hex != nil else { return nil }
    color.name = name
    color.hue = hue
    if let accents = accents { color.accents.append(objectsIn: accents) }
    if let hues = hues { color.hues.append(objectsIn: hues) }
    return color
  }
  
  class func withHex(_ hex: String, name: String, hue: Hue) -> Color? {
    return withHex(hex, name: name, hue: hue, accents: nil, hues: nil)
  }

  class func withHex(_ hex: String, name: String) -> Color? {
    return withHex(hex, name: name, hue: .None, accents: nil, hues: nil)
  }

  override func isEqual(_ object: Any?) -> Bool {
    guard let color = object as? Color else { return false }
    return self == color
  }
}

func ==(lhs: Color, rhs: Color) -> Bool {
  guard lhs.hex == rhs.hex && lhs.name == rhs.name && lhs.hue == rhs.hue else { return false }
  guard lhs.hues.count == rhs.hues.count && lhs.accents.count == rhs.accents.count else { return false }
  for i in 0..<lhs.hues.count {
    guard lhs.hues[i] == rhs.hues[i] else { return false }
  }
  for i in 0..<lhs.accents.count {
    guard lhs.accents[i] == rhs.accents[i] else { return false }
  }
  return true
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
