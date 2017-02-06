import XCTest
import RealmSwift
@testable import Style_Generator

class ColorTests: XCTestCase {
  
  struct Values {
    static let validHex = "FFFFFF"
    static let invalidHex = "@#$%"

    static let hue = Hue.P50
    static let validHueString = "P50"
    static let invalidHueString = "@$!$"

    static let name = "White"
  }
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testColor_Always_HasTheCorrectPrimaryKey() {
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
  
  func testColor_SetWithValidProperties_ReturnsThoseSameProperties() {
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
