import XCTest
import Toolbelt

//TODO: Document somewhere that our collection view (or the controller) has two states – default and selected. Whereas its cells have Default/Deselected. When the collection view is in its default state – all its cells are at their default states. When the collection view transitions ot its selected state, all cells but the selected cell transitions to their 'deselected' cells. But maybe the tests themselves should describe this?

//TODO: see if this is doable
private extension XCUIElement {
//  func isCellInDefaultState() -> Bool {
//    //check that XCUIElement is actually a cell (can we do that)
//    
//  }
//  
//  func isCellInDeselectedState() -> Bool {
//  }
}

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
  
  //TODO: see if something like 'self.app.navigationBars["Primary Color"].buttons["Next"].value can be casted as a UIBarButtonItem?? if so – this changes everything! if so, then add assertions for stuff like – colors of navBar-background, navBar-tint, barButton-tint, cell-backgrounds, if possible

  
  //MARK: - Tests
  func testLoadApp_InDefaultState_ShouldBeInDefaultState() {
    XCTAssertEqual(app.collectionViews.count, 0, "There wasn't exactly 1 collection view as expected")
    //navigation bar title is primary-default localized string
    //navigation bar right button exists and is primary localized string
    //navigation bar right bar button is disabled
    //navigation bar left button does not exist
    //for each cell in collectionViewCells
    //  cell is enabled/hittable
    //  cell is in its default state - check that label is not visible (doesn't exist or isn't hittable etc) if possible
  }
}

//  func testTapRandomCell_InDefaultState_ShouldTransitionToSelectedState() {
//    if let cell = tapRandomCell() {
//      //tapped cell is in default state - check that label is not visible (doesn't exist or isn't hittable etc) if possible
//      //other cells are in deselected state - check that label IS visible (doesn't exist or isn't hittable etc) if possible
//      //navigation bar right bar button is enabled
//      //navigation bar title is cell's default label
//    }
//  }
//
//  func testTapSelectedCell_InSelectedState_ShouldTransitionToDefaultState() {
//    if let cell = tapRandomCell() {
//      cell.tap() // tap it again
//      //now assert the default state for the collecitonView just like we did in testLoadApp_InDefaultState_ShouldBeInDefaultState()
//    }
//  }
//  
  //MARK: - Bring stuff from down here back up as needed ⬇️
  
/*  func _testTapUnselectedCell_InSelectedState_ShouldSwitchSelectedCell() {
    
  }
  
  func _testTapNext_InSelectedState_ShouldTransitionToAccentColorSelection() {
    
  }
  
  //MARK: - Helpers (Assertions)  
  private func assertCollectionViewInDefaultState() {
    //make sure all cells are in default state as wel
    assertNextButtonDisabled()
    for cell in 
  }
  
  
  
  private func assertCellIsSelected(cell: XCUIElement) {
  }
  
  private func assertCellsAreDeselectedExceptFor(_ cell: XCUIElement) {
  }
  
  //MARK: – DRY helpers
  private func isCollectionViewInDefaultState() -> Bool {
  }

  private func isCollectionViewInSelectedState() -> Bool {
  }

  private func isCollectionViewInDeselectedState() -> Bool {
  }

  //MARK: - Helpers (Actions)
    
  private func tapARandomCell() -> XCUIElement? {
    guard let cell = randomCollectionViewCell() else {
      XCTFail("A random cell could not be retrieved")
      return nil
    }
    return cell
  }
  
  //MARK: - Helpers

  private func isSlectedCellLabel(label: String) -> Bool {
    return label.hasPrefix(Accessibility.SelectedTitlePrefix)
  }
  
  private func isDeslectedCellLabel(label: String) -> Bool {
    return label.hasPrefix(Accessibility.DeselectedTitlePrefix)
  }

  func ensureAllCellsAreAtDefaultState() {
    for cell in collectionViewCells() {
      XCTAssertFalse(isSelectedCellLabel(label: cell.label), "A cell was found to be incorrectly selected")
      XCTAssertFalse(isDeselectedCellLabel(label: cell.label), "A cell was found to be incorrectly deselected")
    }
  }
  
  func ensureOnlyOneCellIsSelected(cell: XCUIElement) {
    let cells = collectionViewCells()
    XCTAssertTrue(isSelectedCellLabel(label: cell.label), "The expected cell wasn't selected")
    for otherCell in cells {
      if otherCell == cell {
        XCTAssertTrue(isDeselectedCellLabel(label: otherCell.label), "A cell expected to be in the deselected state, wasn't")
      }
    }
  }
  
  //MARK: - Reusable Helpers
  
  //TODO: move whatever possible from here to Toolbelt
  private func collectionViewCells() -> [XCUIElement] {
    return XCUIApplication().collectionViews.children(matching: .cell).allElementsBoundByIndex
  }
  
  private func randomCollectionViewCell() -> XCUIElement? {
    let cells = collectionViewCells()
    return cells.count > 0 ? cells[(0..<cells.count).random] : nil
  }
  
  //MARK: - 💩
  
//  func _testSelectingAndDeselectingAPrimaryColor() {
//    
//    //TODO: do this a few times
//    //TODO: modularize code in here such as:
//      // …testing that the cell is in its 'unselected-state', i.e. label is hidde, background-color is that of associated value, etc.
//      // …testing that the screen is in a 'selected' or 'unselected' state perhaps – which would in turn use other modularized bits of test code
//      
//    // Tap a random cell
//    let cells = XCUIApplication().collectionViews.children(matching: .cell)
//    let index = (0..<cells.count).random
//    cells.element(boundBy: randomCell).children(matching: other).element.tap()
//  }
  
  // MARK: - Private Functions
  
  // MARK: - Clean the rest!
  
  func _testInitialState() {
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
//    // Check that these things (eventually) happen – give a max delay of say 5 seconds
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
//
//  }
  
//  func testSelectingTheFirstColorFollowedByTheLastColor() {
//    //do this to mainly invoke a swipe down on the scrollView either implicitiyl implicitly or explicitly
//  }
//  
  //TODO: add code that tests transitioning to next screen
 
}
*/
