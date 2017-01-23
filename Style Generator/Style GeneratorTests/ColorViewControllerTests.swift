import XCTest

protocol CollectionViewControllerTestCase {

  //TODO: think about grouping these – why would we want them separate? maybe to remind the implementor of the different things to test for? either way, be awre of how the collectionViewControllers will be created during each setup process. Maybe we can avoid that by having a lazy variable instead? Yeah that's probably what you want either way. So.
  
  // TODO: in this test file and all others, move any heavy test setup code into lazy variables! 
  func testThatNoCellsAreNil()
  func testThatCellCountIsCorrect()
  // Notes: be as abstract and overbearing as possible here – we'll specialize as we go. Remmeber, there are many things like section headers etc. that we're not considering here at all.
}

class ColorViewControllerTests: XCTestCase, CollectionViewControllerTestCase {

  typealias ColorSet = [Color] 

  // TODO: The test colorSets should include: material-primary, material-secondary, just one or two, thousands, many of the same color
  // TODO: stop all branches but master from triggering a build on Travis
  let colorSets: [ColorSet] = ...
  let colorViewControllers: [ColorViewController]
    
  override func setUp() {
    super.setUp()
    for colorSet in colorSets {
      let viewController = ColorViewController() // can do?
      viewController.view // how we load the view programatically?
      colorViewControllers.append(viewController)
    }
  }
    
  override func tearDown() {
    // think about / look into whether you need to do anything here regarding viewController and stuff?
    // either way – what does go here usually?
    super.tearDown()
  }
  
  func testThatNoneOfTheCellsAreNil() {
    XCTAssertTrue(false)
  }
  
  func testThatNumberOfCellsIsAsExpected() {
    XCTAssertTrue(false)
  }
}