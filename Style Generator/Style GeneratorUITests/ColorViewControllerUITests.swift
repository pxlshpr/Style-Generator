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
  
  //UI Test naming convention:
  func testTapAnyCell_InUnselectedState_ShouldSelectCell() {
    
  }
  
  func _testTapSelectedCell_InSelectedState_ShouldUnselectCell() {
    
  }
  
  func _testTapUnselectedCell_InSelectedState_ShouldSwitchSelectedCell() {
    
  }
  
  func _testTapNext_InSelectedState_ShouldTransitionToAccentColorSelection() {
    
  }
  
  // MARK: - Private Functions
  
  func tapCell() {
    let visibleCells = app.collectionViews.children(matching: .cell)
    let randomIndex = randomIntegerBetween0(and: Int(visibleCells.count))
    visibleCells.element(boundBy: UInt(randomCell)).tap()
  }
  
  // MARK: - Clean the rest!
  
  //TODO: think about if the fact that we're only doing this with *visible* cells should be of concern?
  func ensureNoCellsAreSelected() {
  }
  
  func testInitialState() {
    //TODO: move these all to unit-tests!
    // Check that the Navigation Bar:
    // ... title is correct
    // ... has the default tintColor
    
    // Check that the status bar is at its default tint
    
    // Check that next button
    // ... exists
    // ... is initially disabled
    // ... has the default tintColor
    
    // Check that each of the cells:
    // ... have their own associated color value as the background-color
    // ... have their labels hidden initially
    // ... has a size that is reasonable given the UIBounds available (how do we define this?)
  }
  
//  func testSelectingAndDeselectingAPrimaryColor() {
//    
//    //TODO: do this a few times just for funm
//    //TODO: modularize code in here such as:
//    // …testing that the cell is in its 'unselected-state', i.e. label is hidde, background-color is that of associated value, etc.
//    // …testing that the screen is in a 'selected' or 'unselected' state perhaps – which would in turn use other modularized bits of test code
//    
//    // Tap a random cell
//    //TODO: figure out why we can put numbers in boundBy but not variables??
////    let visibleCells = XCUIApplication().collectionViews.children(matching: .cell)
////    let randomCell = randomIntegerBetween0(and: Int(visibleCells.count))
//    
//    XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
//    XCTAssertTrue(true)
//    
//    //    cells.element(boundBy: randomCell).children(matching: other).element.tap()
//    
//    //**** Check that these things (eventually) happen – give a max delay of say 5 seconds
//    
//    // Check that the navigation bar:
//    // …has changed color to the selected cell's color
//    // …has changed its title to the selected cell's color name
//    
//    // Check that the next button:
//    // …has become enabled
//    // …has changed its tintColor depending on the chosen color
//    
//    // Check that the tapped cell:
//    // …retains its selected sate
//    
//    // Check that all cells except the tapped cell (at least those that are in view):
//    // …changed their background-color to grey
//    // …made their title visible, with a white color
//    
//    //****
//  }
  
//  func testSelectingTheFirstColorFollowedByTheLastColor() {
//    //do this to mainly invoke a swipe down on the scrollView either implicitiyl implicitly or explicitly
//  }
//  
  //TODO: add code that tests transitioning to next screen
}
