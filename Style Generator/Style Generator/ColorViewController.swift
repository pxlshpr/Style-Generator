import UIKit
import Toolbelt

class ColorViewController: UIViewController {
  
  enum State {
    case initial
    case selected
  }
  
  // MARK: Lazy Properties
  
  lazy var nextButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(tappedNext))
    button.isEnabled = false
    //    button.accessibilityLabel = NSLocalizedString("hello", comment: "label for Next button")
    button.accessibilityHint = NSLocalizedString("hello", comment: "label for Next button")
    return button
  }()
  
  lazy var layout: UICollectionViewLayout = {
    let layout = UICollectionViewFlowLayout()
    
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    
    let width = 122.0
    layout.itemSize = CGSize(width: width, height: width)
    return layout
  }()
  
    //TODO: remove constants
    
  lazy var collectionView: UICollectionView = {
      let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
      collectionView.dataSource = self
      collectionView.delegate = self
      collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "Cell")
      collectionView.backgroundColor = UIColor.white
      return collectionView
  }()
  
  // MARK: Properties
  
  var state: State = .initial {
    didSet {
      
    }
  }
  
  var selectedIndexPath: IndexPath?
  
  var defaultNavigationBarTintColor: UIColor?
  
  //TODO: make this observe for a 'new data' notification from Realm and update itself accordingly – subsequently reloading the collectionView in a non-obstructive way. It's default should indicate to the collectinView that it is still awaiting data insertion – and we need to decide how we'll display this to the user, if at all.
  var colors: [MaterialColorStruct]
  
  // MARK: View Lifecycle
  
  init() {
    //TODO: we might not need this anymore
    self.colors = []
    super.init(nibName: nil, bundle: nil)
  }
  
  convenience init(colors: [MaterialColorStruct]) {
    self.init()
    
    //TODO: this concept of initiaiting the color View controller with an array of color structs needs to go. We need a way of conveying that we want
    self.colors = colors
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.state = .initial
    
    navigationItem.title = "Primary Color"
    navigationItem.rightBarButtonItem = nextButton
    defaultNavigationBarTintColor = self.navigationController?.navigationBar.barTintColor
    
    view.addSubview(collectionView)
    
    NotificationCenter.default.addObserver(forName: insertionCompletedNotification, object: nil, queue: nil, using: catchInsertionCompletedNotification)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  //TODO: fix the indentation issues, consolidate tabs-vs-spaces over iPad and Mac
  //TODO: move this to another section
  func catchInsertionCompletedNotification(notification: Notification) -> Void {
    //TODO: maybe update our local variable here. Make PrimaryViewCVontroller a subclass or inherit the protocl of the general ColorViewController so that it has the basic displaying logic with a bit of extra stuff for grabbing the speccific data from Realm
    //TODO: this should implicitly cause the collectionView to reload as discussed earlier
  }
  
  // MARK: Actions
  
  func tappedNext() {
    
    //TODO: replace this with the real thing
    let colors = [MaterialColorStruct.brown, MaterialColorStruct.amber]
    let accentViewController = ColorViewController(colors: colors)
    self.navigationController?.pushViewController(accentViewController, animated: true)
    accentViewController.navigationController?.navigationBar.tintColor = self.nextButton.tintColor
  }
}

// MARK: - UICollectionViewDataSource
extension ColorViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // TODO: if we've got the go from Realm, return the list of primary material colors, else loading state so 0 or 1
    return colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    //TODO: Reusable Identifier needs to be a constant, maybe supplied by the ColorCell itself? I dunoo.
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ColorCell {
      
      //TODO: can we assume that this won't be called assuming we have 0 for the number of cells and can simply proceed as if we have the primaries loaded – in which case we still need to edit how we access it. Or maybe leave it as it is, and just have colors load on its own.
      guard indexPath.row < colors.count else {
        return cell
      }
      let color = colors[indexPath.row]
      
      cell.color = color
      switch state {
      case .initial:
        cell.state = .initial
      case .selected:
        if let selectedIndexPath = selectedIndexPath, selectedIndexPath == indexPath {
          cell.state =  .selected
        } else {
          cell.state =  .deselected
        }
      }
      return cell
    } else {
      //TODO: Throw error or something here, bring it to our attention!
      return UICollectionViewCell()
    }
  }
}

// MARK: - UICollectionViewDelegate
extension ColorViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    //TODO: just like when returning a cell, can we assume that actually selecting a cell meant that we selected one with an indexPath? so we just proceed as if the colors have been loaded form the backend
    guard indexPath.row < colors.count else {
      return
    }
    
    switch state {
    case .initial:
      transition(from: .initial, to: .selected, fromSelectingIndexPath: indexPath)
    case .selected:
      if let selectedIndexPath = selectedIndexPath {
        transition(from: .selected, to: indexPath == selectedIndexPath ? .initial : .selected, fromSelectingIndexPath: indexPath)
      } else {
        // TODO: handle invalid state, selected state with no selected index
      }
    }
  }
  
  // MARK: Private functions
  
  private func animateBeforeReloadingCollectionView(animations: @escaping () -> Void) {
    UIView.animate(withDuration: 0.5, animations: {
      animations()
    }, completion: { finished in
      self.collectionView.reloadData()
    })
  }
  
  private func transition(from fromState: State, to toState: State, fromSelectingIndexPath indexPath: IndexPath) {
    
    //TODO: rethink grabbing the color *again* from the array. Maybe we should have either:
    //      1. passed that in here instead and looked up the indexPath when needed, but does that mean looking up the indexPath is less expensive?
    //      2. passed in *both* the indexPath *and* the color object itself, so that we don't have to worry about selecting it? what's wrong with doing it like this? is an excess of parameters more *expensive* in this context?
    let color = colors[indexPath.row]
    
    switch toState {
    case .initial:
      animateBeforeReloadingCollectionView {
        self.colorNavigationBar(withColor: nil)
        self.resetVisibleCells()
      }
      
      navigationItem.title = "Primary Color"
      nextButton.isEnabled = false
      nextButton.tintColor = .black
      selectedIndexPath = nil
      state = .initial
    case .selected:
      animateBeforeReloadingCollectionView {
        self.colorNavigationBar(withColor: color)
        self.colorVisibleCellsExceptThatWithColor(color: color)
      }
      
      navigationItem.title = color.name
      nextButton.isEnabled = true
      nextButton.tintColor = color.barStyle == .black ? .white : .black
      selectedIndexPath = indexPath
      state = .selected
    }
    
  }
  
  private func colorVisibleCellsExceptThatWithColor(color: MaterialColorStruct) {
    if let visibleCells = self.collectionView.visibleCells as? [ColorCell] {
      for visibleCell in visibleCells {
        if let cellColor = visibleCell.color {
          if cellColor == color {
            visibleCell.state = .selected
          } else {
            visibleCell.state = .deselected
          }
        } else {
          visibleCell.state = .deselected
        }
      }
    }
  }
  
  private func resetVisibleCells() {
    if let visibleCells = self.collectionView.visibleCells as? [ColorCell] {
      for visibleCell in visibleCells {
        visibleCell.state = .initial
      }
    }
  }
  
  
  private func colorNavigationBar(withColor color: MaterialColorStruct?) {
    if let controller = self.navigationController {
      if let color = color {
        controller.navigationBar.barTintColor = color.uiColor
        controller.navigationBar.barStyle = color.barStyle
      } else {
        controller.navigationBar.barTintColor = defaultNavigationBarTintColor
        controller.navigationBar.barStyle = .default
      }
      
      self.navigationController?.navigationBar.layoutIfNeeded()
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
}
