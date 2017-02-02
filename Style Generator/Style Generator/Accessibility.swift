import Foundation

class Accessibility {

  static func prefixedTitleToIndicateSelected(withTitle title: String) -> String {
    let template = NSLocalizedString("selected: %@", comment: "accessibility label for a selected cell")
    return String.localizedStringWithFormat(template, title)
  }

  static var SelectedTitlePrefix: String {
    return prefixedTitleToIndicateSelected(withTitle: "")
  }
}
