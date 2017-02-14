import UIKit

class ColorCell: UICollectionViewCell {
  
  enum State {
    case initial
    case selected
    case deselected
  }
  
  // MARK: Properties
  
  var state: State = .initial {
    didSet {
      switch state {
      case .initial:
        colorBackground()
        hideLabel()
      case .selected:
        colorBackground()
        hideLabel()
      case .deselected:
        self.backgroundColor = UIColor.lightGray
        showLabel()
      }
      accessibilityLabel = labelString
    }
  }
  
  var labelString: String? {
    guard let labelText = label.text else { return nil }
    guard state == .selected else { return labelText }
    return Accessibility.prefixedTitleToIndicateSelected(withTitle: labelText)
  }
  
  var color: MaterialColorStruct?
  
  lazy var label: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
    label.font = UIFont.boldSystemFont(ofSize: 14.0)
    label.textColor = UIColor.white
    label.textAlignment = .center
    label.text = "Label"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: Helpers
  
  private func showLabel() {
    hideLabel()
    setLabelText()
    addSubview(label)
    //        label.center = center
  }
  
  private func setLabelText() {
    if let color = self.color {
      label.text = color.name
    } else {
      //TODO: this doesn't work as intended as its not always set. Think of an alternative
//      label.text = "Label"
    }
  }
  private func hideLabel() {
    label.removeFromSuperview()
  }
  
  private func colorBackground() {
    if let color = self.color {
      self.backgroundColor = color.uiColor
    }
  }
}
