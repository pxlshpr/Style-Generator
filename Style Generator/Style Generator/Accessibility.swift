import Foundation

class Accessibility {

  static func prefixedTitleToIndicateDeselected(withTitle title: String) -> String {
    let template = NSLocalizedString("deselected: %@", comment: "accessibility label for a deselected cell")
    return String.localizedStringWithFormat(template, title)
  }

  static var DeselectedTitlePrefix: String {
    return prefixedTitleToIndicateDeselected(withTitle: "")
  }
}
