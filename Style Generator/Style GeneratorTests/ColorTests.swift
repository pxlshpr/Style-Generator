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
  
  func testColor_setWithValues_ReturnsThoseValuesWhenCalled() {
    let color = Color()
    color.hex = Values.validHex
    color.name = Values.name
    color.hue = Values.hue
    color.accents.append(Values.accent1)
    color.accents.append(Values.accent2)
    color.hues.append(Values.hue2)
    color.hues.append(Values.hue2)
    
    XCTAssertEqual(color.hex, Values.validHex)
    XCTAssertEqual(color.name, Values.name)
    XCTAssertEqual(color.hue, Values.hue)
    XCTAssertEqual(color.hues.count, 2)
    XCTAssertEqual(color.accents.count, 2)
    
    guard color.hues.count == 2, color.accents.count == 2 else {
      return
    }
    
    XCTAssertEqual(color.hues[0].hex, Values.hue1.hex)
    XCTAssertEqual(color.hues[0].name, Values.hue1.name)
    XCTAssertEqual(color.hues[0].hue, Values.hue1.hue)
    XCTAssertEqual(color.hues[1].hex, Values.hue2.hex)
    XCTAssertEqual(color.hues[1].name, Values.hue2.name)
    XCTAssertEqual(color.hues[1].hue, Values.hue2.hue)
    
    XCTAssertEqual(color.accents[0].hex, Values.accent1.hex)
    XCTAssertEqual(color.accents[0].name, Values.accent1.name)
    XCTAssertEqual(color.accents[0].hue, Values.accent1.hue)
    XCTAssertEqual(color.accents[1].hex, Values.accent2.hex)
    XCTAssertEqual(color.accents[1].name, Values.accent2.name)
    XCTAssertEqual(color.accents[1].hue, Values.accent2.hue)
  }
  
  func testColor_SetWithValidValues_SetsValuesAsExpected() {
    let color = Color()
    color.hex = Values.validHex
    color.name = Values.name
    color.hue = Values.hue
    XCTAssertEqual(color.hex, Values.validHex)
    XCTAssertEqual(color.name, Values.name)
    XCTAssertEqual(color.hue, Values.hue)
    
    //Important: we won't be testing creating an object using an array or dictionary due to the complications with our workarounds (private variables) that allow property validation and storing enums
  }

  func testColor_SetWithInvalidHex_SetsHexToBeNil() {
    let color = Color()
    color.hex = Values.invalidHex
    XCTAssertNil(color.hex)
  }  
}
