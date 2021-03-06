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

//TODO: rename this according to state and make it a localized string that is shared with the codebase (maybe make the strings file available in both?
struct ExpectedStrings {
  
  struct NavigationTitle {
    static let PrimaryDefault = "Primary Color"
  }
  
  struct BarButtonLabels {
    static let PrimaryNext = "Next"
  }
}

class ColorGridViewControllerUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  var cells: [XCUIElement] {
    return XCUIApplication().collectionViews.children(matching: .cell).allElementsBoundByIndex
  }

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func _testLoadApp_InDefaultState_ShouldBeInDefaultState() {
    assertApp_DefaultState()
  }
  
  func testTapRandomCell_InDefaultState_ShouldTransitionToSelectedState() {
    
    //assuming that assertApp_DefaultState() would work here since its in another test
    
    let randomIndex = (0..<cells.count).random
    let randomCell = cells[randomIndex]
    
    var otherCells = [XCUIElement]()
    for i in 0..<cells.count {
      guard i != randomIndex else { continue }
      otherCells.append(cells[i])
    }
    
    randomCell.tap()
    XCTAssertTrue(randomCell.isCellInSelectedState, "Tapped cell wasn't in selected state as expected")
    for cell in otherCells {
      print("asserting that \(cell.label) is deselected")
      cell.assertCellInDeselectedState()
//      XCTAssertTrue(cell.isCellInDeselectedState, "Cell wasn't in deselected state as expected")
    }
    
    //TODO: we need to properly determine the label of the navigation bar before proceeding!
//    let label = randomCell.label.replacingOccurrences(of: Accessibility.SelectedTitlePrefix, with: "")
//    //navigation bar right bar button is enabled
//    let navigationBar = app.navigationBars[label]
//    let nextButton = navigationBar.buttons[ExpectedStrings.BarButtonLabels.PrimaryNext]
//    XCTAssertTrue(nextButton.isEnabled, "Next button is incorrectly enabled initially")
    
    //navigation bar title is cell's default label. Do the thingw here we select another cell (either the first or last one, and record our random cell's title, and then select the random cell again and now make sure that the navigation bar title matches it!)
    //XCTAssert...
  }

}

extension ColorGridViewControllerUITests {
  
  func assertApp_DefaultState() {
    let navigationBar = app.navigationBars[ExpectedStrings.NavigationTitle.PrimaryDefault]
    XCTAssertTrue(navigationBar.exists, "Navigation bar with expected title doesn't exist")
    XCTAssertEqual(navigationBar.buttons.count, 1, "Navigation bar initially has more than 1 button")
    
    let nextButton = navigationBar.buttons[ExpectedStrings.BarButtonLabels.PrimaryNext]
    XCTAssertTrue(nextButton.exists, "Next button doesn't exist on navigation bar")
    XCTAssertFalse(nextButton.isEnabled, "Next button is incorrectly enabled initially")
    
    XCTAssertEqual(app.collectionViews.count, 1, "There wasn't exactly 1 collection view as expected")
    let cells = XCUIApplication().collectionViews.children(matching: .cell).allElementsBoundByIndex
    XCTAssertGreaterThan(cells.count, 0, "Collection view initially has no cells")
    
    for cell in cells {
      XCTAssertTrue(cell.isCellInDefaultState, "Cell wasn't initially in default state as expected")
    }
  }
}

private extension XCUIElement {  
  var isCellInDefaultState: Bool {
    guard isCell else { return false }
    
    let hasNoStaticTexts = children(matching: .staticText).count == 0
    let hasNoAccessibilityPrefix = !label.hasPrefix(Accessibility.SelectedTitlePrefix)
    return hasNoStaticTexts && hasNoAccessibilityPrefix
  }
  
  var isCellInSelectedState: Bool {
    guard isCell else { return false }
    
    let hasNoStaticTexts = children(matching: .staticText).count == 0
    let hasAccessibilityPrefix = label.hasPrefix(Accessibility.SelectedTitlePrefix)
    return hasNoStaticTexts && hasAccessibilityPrefix
  }
  
  var isCellInDeselectedState: Bool {
    guard isCell else { return false }
    
    let hasStaticText = children(matching: .staticText).count == 1
    let hasNoAccessibilityPrefix = !label.hasPrefix(Accessibility.SelectedTitlePrefix)
    return hasStaticText && hasNoAccessibilityPrefix
  }
  
  func assertCellInDeselectedState() {
    guard isCell else { return }
    
    XCTAssertEqual(children(matching: .staticText).count, 1)
    XCTAssertFalse(label.hasPrefix(Accessibility.SelectedTitlePrefix))
  }
  
  //MARK: - Simpler
  
  var isCell: Bool {
    return elementType == .cell
  }  
}

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


//TODO: add this to toolbelt (first see if really needed anymore)
//http://stackoverflow.com/questions/33422681/xcode-ui-test-ui-testing-failure-failed-to-scroll-to-visible-by-ax-action/33534187#33534187
/*Sends a tap event to a hittable/unhittable element.*/
extension XCUIElement {
  func forceTapElement() {
    if self.isHittable {
      self.tap()
    }
    else {
      let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
      coordinate.tap()
    }
  }
}

//TOOD: add this to toolbelt with tests
extension Array {
  //TODO: why is it that an element returned cannot be compared back with it inside the array again? or is it a problem with XCUIElement's equatable-ness?
  var random: Element {
    return self[(0..<self.count).random]
  }
}

