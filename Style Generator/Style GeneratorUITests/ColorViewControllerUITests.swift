import XCTest
import Toolbelt

class ColorViewControllerUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  
  /**
   Test that when a primary color cell is tapped, the UI changed accordingly
   */
  func testExample() {
    
    //lets select a random cell each time
    let cells = XCUIApplication().collectionViews.children(matching: .cell)
    print(cells.count)
//    XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.tap()
  }
  
}
