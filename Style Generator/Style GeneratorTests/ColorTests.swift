import XCTest
import RealmSwift
@testable import Style_Generator

class ColorTests: XCTestCase {
  
  struct Values {
    static let validHex = "FFFFFF"
    static let invalidHex = "@#$%"
    
    static let name = "White"
    static let hue = "P50"
    static let accents = List<Color>()
    static let hues = List<Color>()
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
    XCTAssertEqual(color.hex, Values.validHex)
    XCTAssertEqual(color.name, Values.name)
    
    let colorFromDict = Color(value: [Keys.Color.hex: Values.validHex, Keys.Color.name: Values.name])
    XCTAssertEqual(colorFromDict.hex, Values.validHex)
    XCTAssertEqual(colorFromDict.name, Values.name)
    
    let colorFromArray = Color(value: [Values.validHex, Values.name, Values.hue, Values.accents, Values.hues])
    XCTAssertEqual(colorFromArray.hex, Values.validHex)
    XCTAssertEqual(colorFromArray.name, Values.name)
  }

  func _testColor_SetWithInvalidHex_CausesFatalError() {
    let color = Color()
    color.hex = "@#@#"
    XCTAssertNil(color.hex)

//    let colorFromDict = Color(value: ["hex": "@#@#", "name": "White"])
//    XCTAssertNil(invalidColor.hex)
    
    let colorFromArray = Color(value: ["@#@#", "White", ""])
    XCTAssertNil(colorFromArray.hex)
  }
  
}
