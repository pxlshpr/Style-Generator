import XCTest
import RealmSwift
@testable import Style_Generator

class ColorTests: XCTestCase {
  
  struct Values {
    static let validHex = "FFFFFF"
    static let invalidHex = "@#$%"

    static let hue = Hue.P50
    static let name = "White"
    
    static let accent1 = Color()
    static let accent2 = Color()
    
    static let hue1 = Color()
    static let hue2 = Color()
  }
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testColor_HasCorrectPrimaryKey() {
    XCTAssertEqual(Color.primaryKey(), Keys.Color.hex)
  }
  
  func testColor_Initialized_HasNilPropertiesAndEmptyLists() {
    let color = Color()
    XCTAssertNil(color.hex)
    XCTAssertNil(color.name)
    XCTAssertEqual(color.accents.count, 0)
    XCTAssertEqual(color.hues.count, 0)
    XCTAssertNil(color.hue)
  }
  
  func testColor_InitializedThenValuesSet_SetsValuesAsExpected() {
    if let accent = Color.withHex("000000", name: "Accent"),
      let hue = Color.withHex("FFFFFF", name: "Hue")
    {
      let color = Color()
      color.hex = "ABCDEF"
      color.name = "Color"
      color.hue = .P50
      color.accents.append(accent)
      color.hues.append(hue)
      
      XCTAssertEqual(color.hex, "ABCDEF")
      XCTAssertEqual(color.name, "Color")
      XCTAssertEqual(color.hue, .P50)
      XCTAssertEqual(color.hues.count, 1)
      XCTAssertEqual(color.accents.count, 1)
      XCTAssertEqual(color.hues[0], hue)
      XCTAssertEqual(color.accents[0], accent)
    } else {
      XCTFail("Couldn't create a supporting color")
    }
  }
  
  func testColor_CreatedWithHelpers_SetsValuesAsExpected() {
    
    if let accent1 = Color.withHex("000000", name: "Accent 1"),
      let accent2 = Color.withHex("000001", name: "Accent 2"),
      let hue1 = Color.withHex("000002", name: "Hue 1"),
      let hue2 = Color.withHex("000003", name: "Hue 2")
    {
      XCTAssertEqual(accent1.hex, "000000")
      XCTAssertEqual(accent1.name, "Accent 1")
      XCTAssertEqual(accent2.hex, "000001")
      XCTAssertEqual(accent2.name, "Accent 2")
      XCTAssertEqual(hue1.hex, "000002")
      XCTAssertEqual(hue1.name, "Hue 1")
      XCTAssertEqual(hue2.hex, "000003")
      XCTAssertEqual(hue2.name, "Hue 2")
      for color in [accent1, accent2, hue1, hue2] {
        XCTAssertEqual(color.hue, Hue.None)
        XCTAssertEqual(color.hues.count, 0)
        XCTAssertEqual(color.accents.count, 0)
      }
      
      guard let color = Color.withHex("FFFFFF", name: "Color 1", hue: .P50, accents: [accent1, accent2], hues: [hue1, hue2]) else {
        XCTFail("Couldn't create color with Color.withHex(_::::)")
        return
      }
      XCTAssertEqual(color.hex, "FFFFFF")
      XCTAssertEqual(color.name, "Color 1")
      XCTAssertEqual(color.hue, .P50)
      XCTAssertEqual(color.accents.count, 2)
      XCTAssertEqual(color.hues.count, 2)
      XCTAssertEqual(color.accents[0], accent1)
      XCTAssertEqual(color.accents[1], accent2)
      XCTAssertEqual(color.hues[0], hue1)
      XCTAssertEqual(color.hues[1], hue2)
      
    } else {
      XCTFail("One of the supporting colors weren't created")
    }
    
    guard let color = Color.withHex("ACE25F", name: "Color 2", hue: .None) else {
      XCTFail("Couldn't create color using Color.withHex(_::)")
      return
    }
    XCTAssertEqual(color.hex, "ACE25F")
    XCTAssertEqual(color.name, "Color 2")
    XCTAssertEqual(color.hue, Hue.None)
    XCTAssertEqual(color.accents.count, 0)
    XCTAssertEqual(color.hues.count, 0)
    
    //Important: we won't be testing creating an object using an array or dictionary due to the complications with our workarounds (private variables) that allow property validation and storing enums
  }
  
  func testColor_CreatedWithInvalidHex_SetsHexToBeNil() {
    let color = Color()
    color.hex = Values.invalidHex
    XCTAssertNil(color.hex)
  }
  
  func testColor_CheckForEquality_WorksAsExpected() {
    
    guard let accent1 = Color.withHex("A512FC", name: "Accent 1"),
      let accent2 = Color.withHex("ABCDEF", name: "Accent 2", hue: Hue.A200),
      let hue1 = Color.withHex("FA23AC", name: "Hue 1"),
      let hue2 = Color.withHex("0A2FBA", name: "Hue 2"),
      let color1 = Color.withHex("FFFFFF", name: "White", hue: .P50, accents: [accent1, accent2], hues: [hue1, hue2])
    else {
      XCTFail("Couldn't create a color")
      return
    }
    
    let color2 = Color()
    color2.hex = "FFFFFF"
    color2.name = "White"
    color2.hue = .P50
    color2.accents.append(accent1)
    color2.accents.append(accent2)
    color2.hues.append(hue1)
    color2.hues.append(hue2)
    XCTAssertEqual(color1, color2)
    XCTAssertTrue(color1 == color2)
    
    // even a difference in the order of hues ould result in not being equal
    let color3 = Color()
    color3.hex = "FFFFFF"
    color3.name = "White"
    color3.hue = .P50
    color3.accents.append(accent1)
    color3.accents.append(accent2)
    color3.hues.append(hue2)
    color3.hues.append(hue1)
    XCTAssertNotEqual(color3, color1)
    XCTAssertFalse(color3 == color1)
    
    // We will add tests here as we encounter edge cases. For now, we've covered an extreme case of  testing for inequality and that's enough.
  }
  
  func testColor_CreatedWithValidHex_ShouldReturnTheExpectedBarStyle() {
  }
  
  func testColor_CreatedWithValidHex_ShouldReturnTheExpectedUIColor() {
  }
}

