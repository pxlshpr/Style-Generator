import Foundation

class Accessibility {
    static func titlePrefixedToIndicateSelected(title: String) -> String {
        /* Genstrings uses first argument verbatim when generating
         * Localizable.strings files,
         * so interpolating a constant prefix here like "\(prefix): %@"
         * would not be terribly useful. */
        let template = NSLocalizedString("done: %@",
            comment: "accessibility label for a selected cell")
        let label = NSString.localizedStringWithFormat(template, title)
        return label as String
    }

    static var SelectedTitlePrefix: String {
        return titlePrefixedToIndicateSelected("")
    }
}