import Foundation
import RealmSwift

class ColorObject: Object {
    
    enum MaterialColorHue {
        case P500, P50, P100, P200, P300, P400, P600, P700, P800, P900
        case A100, A200, A400, A700
    }

    dynamic var hex = ""
    
    dynamic var name: String?
    dynamic var hue: String?

	// array of MaterialColors that may be used as accents for this color    
    let accents = List<ColorObject>()
        
    //TODO: decide if we should have a stored array of relationships to other colors or if we should instead have a property of some sort that allows us to dynamically grab these from the realm we're in at any given time? what's possible? what's better?
    let hues = List<ColorObject>()
    
    override static func primaryKey() -> String? {
        return "hex"
    }
    
    class func addMaterialColors() {

        //TODO: now use the data in Realm to load collection views
        //TODO: cleanup (remove) the extra returns in arrays and have a multidimensional array of our data to derive from
        
        addColor(withName: "Red", hexes: ["FFEBEE", "FFCDD2", "EF9A9A", "E57373", "EF5350", "F44336", "E53935", "D32F2F", "C62828", "B71C1C", "FF8A80", "FF5252", "FF1744", "D50000"])
        addColor(withName: "Pink", hexes: ["FCE4EC", "F8BBD0", "F48FB1", "F06292", "EC407A", "E91E63", "D81B60", "C2185B", "AD1457", "880E4F", "FF80AB", "FF4081", "F50057", "C51162"])
        addColor(withName: "Purple", hexes: ["F3E5F5", "E1BEE7", "CE93D8", "BA68C8", "AB47BC", "9C27B0", "8E24AA", "7B1FA2", "6A1B9A", "4A148C", "EA80FC", "E040FB", "D500F9", "AA00FF"])
        addColor(withName: "Deep Purple", hexes: ["EDE7F6", "D1C4E9", "B39DDB", "9575CD", "7E57C2", "673AB7", "5E35B1", "512DA8", "4527A0", "311B92", "B388FF", "7C4DFF", "651FFF", "6200EA"])
        addColor(withName: "Indigo", hexes: ["E8EAF6",
                                             "C5CAE9",
                                             "9FA8DA",
                                             "7986CB",
                                             "5C6BC0",
                                             "3F51B5",
                                             "3949AB",
                                             "303F9F",
                                             "283593",
                                             "1A237E",
                                             "8C9EFF",
                                             "536DFE",
                                             "3D5AFE",
                                             "304FFE"])
        addColor(withName: "Blue", hexes: ["E3F2FD",
                                           "BBDEFB",
                                           "90CAF9",
                                           "64B5F6",
                                           "42A5F5",
                                           "2196F3",
                                           "1E88E5",
                                           "1976D2",
                                           "1565C0",
                                           "0D47A1",
                                           "82B1FF",
                                           "448AFF",
                                           "2979FF",
                                           "2962FF"])
        addColor(withName: "Light Blue", hexes: ["E1F5FE",
                                                 "B3E5FC",
                                                 "81D4FA",
                                                 "4FC3F7",
                                                 "29B6F6",
                                                 "03A9F4",
                                                 "039BE5",
                                                 "0288D1",
                                                 "0277BD",
                                                 "01579B",
                                                 "80D8FF",
                                                 "40C4FF",
                                                 "00B0FF",
                                                 "0091EA"])
        addColor(withName: "Cyan", hexes: ["E0F7FA",
                                           "B2EBF2",
                                           "80DEEA",
                                           "4DD0E1",
                                           "26C6DA",
                                           "00BCD4",
                                           "00ACC1",
                                           "0097A7",
                                           "00838F",
                                           "006064",
                                           "84FFFF",
                                           "18FFFF",
                                           "00E5FF",
                                           "00B8D4"])
        addColor(withName: "Teal", hexes: ["E0F2F1",
                                           "B2DFDB",
                                           "80CBC4",
                                           "4DB6AC",
                                           "26A69A",
                                           "009688",
                                           "00897B",
                                           "00796B",
                                           "00695C",
                                           "004D40",
                                           "A7FFEB",
                                           "64FFDA",
                                           "1DE9B6",
                                           "00BFA5"])
        addColor(withName: "Green", hexes: ["E8F5E9",
                                            "C8E6C9",
                                            "A5D6A7",
                                            "81C784",
                                            "66BB6A",
                                            "4CAF50",
                                            "43A047",
                                            "388E3C",
                                            "2E7D32",
                                            "1B5E20",
                                            "B9F6CA",
                                            "69F0AE",
                                            "00E676",
                                            "00C853"])
        addColor(withName: "Light Green", hexes: ["F1F8E9",
                                                  "DCEDC8",
                                                  "C5E1A5",
                                                  "AED581",
                                                  "9CCC65",
                                                  "8BC34A",
                                                  "7CB342",
                                                  "689F38",
                                                  "558B2F",
                                                  "33691E",
                                                  "CCFF90",
                                                  "B2FF59",
                                                  "76FF03",
                                                  "64DD17"])
        addColor(withName: "Lime", hexes: ["F9FBE7",
                                           "F0F4C3",
                                           "E6EE9C",
                                           "DCE775",
                                           "D4E157",
                                           "CDDC39",
                                           "C0CA33",
                                           "AFB42B",
                                           "9E9D24",
                                           "827717",
                                           "F4FF81",
                                           "EEFF41",
                                           "C6FF00",
                                           "AEEA00"])
        addColor(withName: "Yellow", hexes: ["FFFDE7",
                                             "FFF9C4",
                                             "FFF59D",
                                             "FFF176",
                                             "FFEE58",
                                             "FFEB3B",
                                             "FDD835",
                                             "FBC02D",
                                             "F9A825",
                                             "F57F17",
                                             "FFFF8D",
                                             "FFFF00",
                                             "FFEA00",
                                             "FFD600"])
        addColor(withName: "Amber", hexes: ["FFF8E1",
                                            "FFECB3",
                                            "FFE082",
                                            "FFD54F",
                                            "FFCA28",
                                            "FFC107",
                                            "FFB300",
                                            "FFA000",
                                            "FF8F00",
                                            "FF6F00",
                                            "FFE57F",
                                            "FFD740",
                                            "FFC400",
                                            "FFAB00"])
        addColor(withName: "Orange", hexes: ["FFF3E0",
                                             "FFE0B2",
                                             "FFCC80",
                                             "FFB74D",
                                             "FFA726",
                                             "FF9800",
                                             "FB8C00",
                                             "F57C00",
                                             "EF6C00",
                                             "E65100",
                                             "FFD180",
                                             "FFAB40",
                                             "FF9100",
                                             "FF6D00"])
        addColor(withName: "Deep Orange", hexes: ["FBE9E7",
                                                  "FFCCBC",
                                                  "FFAB91",
                                                  "FF8A65",
                                                  "FF7043",
                                                  "FF5722",
                                                  "F4511E",
                                                  "E64A19",
                                                  "D84315",
                                                  "BF360C",
                                                  "FF9E80",
                                                  "FF6E40",
                                                  "FF3D00",
                                                  "DD2C00"])
        addColor(withName: "Brown", hexes: ["EFEBE9",
                                            "D7CCC8",
                                            "BCAAA4",
                                            "A1887F",
                                            "8D6E63",
                                            "795548",
                                            "6D4C41",
                                            "5D4037",
                                            "4E342E",
                                            "3E2723"])
        addColor(withName: "Grey", hexes: ["FAFAFA",
                                           "F5F5F5",
                                           "EEEEEE",
                                           "E0E0E0",
                                           "BDBDBD",
                                           "9E9E9E",
                                           "757575",
                                           "616161",
                                           "424242",
                                           "212121"])
        addColor(withName: "Blue Grey", hexes: ["ECEFF1",
                                                "CFD8DC",
                                                "B0BEC5",
                                                "90A4AE",
                                                "78909C",
                                                "607D8B",
                                                "546E7A",
                                                "455A64",
                                                "37474F",
                                                "263238"])
        //TODO: Now send out a notification that informs the collectionViewControllers of the insertion being completion and to update their local properties (derived from the inserted data) and reload their collectionViews") – as it does take ~150ms for this to happen, and that's on the simulator.
        
    }
    
    class func addColor(withName name: String, hexes: [String]) {
        
        guard hexes.count == 14 || hexes.count == 10 else {
            print("Hexes count invalid")
            return
        }
        
        let color50 = ColorObject(value: [hexes[0], name, "50", [], []])
        let color100 = ColorObject(value: [hexes[1], name, "100", [], []])
        let color200 = ColorObject(value: [hexes[2], name, "200", [], []])
        let color300 = ColorObject(value: [hexes[3], name, "300", [], []])
        let color400 = ColorObject(value: [hexes[4], name, "400", [], []])
        let color500 = ColorObject(value: [hexes[5], name, "500", [], []])
        let color600 = ColorObject(value: [hexes[6], name, "600", [], []])
        let color700 = ColorObject(value: [hexes[7], name, "700", [], []])
        let color800 = ColorObject(value: [hexes[8], name, "800", [], []])
        let color900 = ColorObject(value: [hexes[9], name, "900", [], []])
        let colors: [ColorObject]
        if hexes.count == 14 {
            let colorA100 = ColorObject(value: [hexes[10], name, "A100", [], []])
            let colorA200 = ColorObject(value: [hexes[11], name, "A200", [], []])
            let colorA400 = ColorObject(value: [hexes[12], name, "A400", [], []])
            let colorA700 = ColorObject(value: [hexes[13], name, "A700", [], []])
            colors = [color50, color100, color200, color300, color400, color500, color600, color700, color800, color900, colorA100, colorA200, colorA400, colorA700]
        } else {
            colors = [color50, color100, color200, color300, color400, color500, color600, color700, color800, color900]
        }
        
        for color in colors {
            let realm = try! Realm()
            try! realm.write {
                color.hues.append(objectsIn: colors.filter { $0 != color })
                realm.add(color)
            }
        }
    }
}

func deleteAllRealmData() {
    let realm = try! Realm()
    try! realm.write {
        realm.deleteAll()
    }
}
