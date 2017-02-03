import XCTest

protocol CollectionViewControllerTestCase {

  //TODO: think about grouping these – why would we want them separate? maybe to remind the implementor of the different things to test for? either way, be awre of how the collectionViewControllers will be created during each setup process. Maybe we can avoid that by having a lazy variable instead? Yeah that's probably what you want either way. So.
  
  func testThatNoCellsAreNil()
  func testThatCellCountIsCorrect()
  // Notes: be as abstract and overbearing as possible here – we'll specialize as we go. Remmeber, there are many things like section headers etc. that we're not considering here at all.
}

class ColorViewControllerTests: XCTestCase, CollectionViewControllerTestCase {

//  typealias ColorSet = [Color] 
//
//  // TODO: The test colorSets should include: material-primary, material-secondary, just one or two, thousands, many of the same color
//  // TODO: stop all branches but master from triggering a build on Travis
//  let colorSets: [ColorSet] = ...
//  let colorViewControllers: [ColorViewController]
  
  override func setUp() {
    super.setUp()
//    for colorSet in colorSets {
//      let viewController = ColorViewController() // can do?
//      viewController.view // how we load the view programatically?
//      colorViewControllers.append(viewController)
//    }
  }
    
  override func tearDown() {
    // think about / look into whether you need to do anything here regarding viewController and stuff?
    // either way – what does go here usually?
    super.tearDown()
  }
  
  func testThatNoCellsAreNil() {
    XCTAssertTrue(false)
  }
  
  func testThatCellCountIsCorrect() {
    XCTAssertTrue(false)
  }
  
  func testLoadApp_InDefaultState_CollectionViewShouldBeInDefaultState() {
    //check for the initial state of the:
     // - navigation bar
     // - status bar
     // - next button
     // - 
  }
  
  func testLoadApp_InDefaultState_CollectionViewCellsShouldBeAppropriatelySizedForDevice() {
    // retreive available screen real estate and check that the cells are makingt he most of it and have optimal spacing (not too muich, not too little)
  }  
  
  func testTapRandomCell_InDefaultState_ShouldSelectCell() {
    //programatically tap a random cell
    //assert that the cell is selected -> in this case check for things more specific -> like that the HEX color is set as its background. color and the label is hidden
    //have funcs for checking if a cell is highlighted etc
    // check that the collectionview has moved into what we define as a selected state by coloring the navigation bar and enabling the Next button
    // Check that our internal variables tracking the state of the cells and the collection *AND* the actualy selected 'color' are all as expected
  }
  
  
  func testTapSelectedCell_InSelectedState_ShouldReturnCollectionViewToDefaultState() {
  }
  
  func _testTapUnselectedCell_InSelectedState_ShouldSwitchSelectedCell() {    
  }
  
  func _testTapNext_InSelectedState_ShouldTransitionToAccentColorSelection() {

  }
}
