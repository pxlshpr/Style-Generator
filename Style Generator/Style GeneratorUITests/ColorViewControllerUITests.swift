import XCTest
import Toolbelt

class ColorViewControllerUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  //TODO: replace with strings key for localization
//  struct Strings {
//    static let primaryColorTitle = "Primary Color"
//    static let nextButtonTitle = "Next"
//  }
  
//  func testInitialLoad() {
//    // Check that the Navigation Bar:
//    let navigationBar = app.navigationBars[Strings.primaryColorTitle]
//    let nextButton = navigationBar.buttons[Strings.nextButtonTitle]
//    
//    XCTAssert(navigationBar.exists, "Navigation bar with title ")
//    XCTAssert(nextButton.exists, "Next button doesn't exist")
//    XCTAssertFalse(nextButton.isEnabled, "Next button isn't disabled initially")
//    
//    
//    let color = navigationBar.value(forKey: "tintColor")
//    
//    XCTAssertTrue(true)
//    // …tintColor and nextButton's tintColor is at the default
//    
//    // Check that the status bar is at its default tint
//    // Check that there is one and only one collectionView, that:
//    // …has the same number of cells as the number of primary colors in Realm (should we really do this?)
//    // …some sort of sizing constraint with respect to UIBounds to ensure that an adequate number of cells are displayed at any given time
//    
//    // Check that each of the cells:
//    // …have their own associated color value as the background-color
//    // …have their labels hidden
//  }
//  
  func testSelectingAndDeselectingAPrimaryColor() {
    
    //TODO: do this a few times just for funm
    //TODO: modularize code in here such as:
    // …testing that the cell is in its 'unselected-state', i.e. label is hidde, background-color is that of associated value, etc.
    // …testing that the screen is in a 'selected' or 'unselected' state perhaps – which would in turn use other modularized bits of test code
    
    // Tap a random cell
    //TODO: figure out why we can put numbers in boundBy but not variables??
//    let cells = XCUIApplication().collectionViews.children(matching: .cell)
//    let randomCell = randomIntegerBetween0(and: Int(cells.count))
    
    XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
    XCTAssertTrue(true)
    
    //    cells.element(boundBy: randomCell).children(matching: other).element.tap()
    
    //**** Check that these things (eventually) happen – give a max delay of say 5 seconds
    
    // Check that the navigation bar:
    // …has changed color to the selected cell's color
    // …has changed its title to the selected cell's color name
    
    // Check that the next button:
    // …has become enabled
    // …has changed its tintColor depending on the chosen color
    
    // Check that the tapped cell:
    // …retains its selected sate
    
    // Check that all cells except the tapped cell (at least those that are in view):
    // …changed their background-color to grey
    // …made their title visible, with a white color
    
    //****
  }
  
//  func testSelectingTheFirstColorFollowedByTheLastColor() {
//    //do this to mainly invoke a swipe down on the scrollView either implicitiyl implicitly or explicitly
//  }
//  
  //TODO: add code that tests transitioning to next screen
}
