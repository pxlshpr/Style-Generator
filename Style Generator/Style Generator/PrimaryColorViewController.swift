//
//  ViewController.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 14/12/16.
//  Copyright © 2016 Ahmed Khalaf. All rights reserved.
//

import UIKit

struct MaterialColor {
    var name: String
    var hex: String
    var barStyle: UIBarStyle
    
    init(name: String, hex: String) {
        self.init(name: name, hex: hex, barStyle: .black)
    }
    
    init(name: String, hex: String, barStyle: UIBarStyle) {
        self.name = name
        self.hex = hex
        self.barStyle = barStyle
    }
}

let MaterialColors = [
    MaterialColor(name: "Red", hex: "#F44336"),
    MaterialColor(name: "Pink", hex: "#E91E63"),
    MaterialColor(name: "Purple", hex: "#9C27B0"),
    MaterialColor(name: "Deep Purple", hex: "#673AB7"),
    MaterialColor(name: "Indigo", hex: "#3F51B5"),
    MaterialColor(name: "Blue", hex: "#2196F3"),
    MaterialColor(name: "Light Blue", hex: "#03A9F4"),
    MaterialColor(name: "Cyan", hex: "#00BCD4"),
    MaterialColor(name: "Teal", hex: "#009688"),
    MaterialColor(name: "Green", hex: "#4CAF50"),
    MaterialColor(name: "Light Green", hex: "#8BC34A"),
    MaterialColor(name: "Lime", hex: "#CDDC39"),
    MaterialColor(name: "Yellow", hex: "#FFEB3B", barStyle: .default),
    MaterialColor(name: "Amber", hex: "#FFC107"),
    MaterialColor(name: "Orange", hex: "#FF9800"),
    MaterialColor(name: "Deep Orange", hex: "#FF5722"),
    MaterialColor(name: "Brown", hex: "#795548"),
    MaterialColor(name: "Grey", hex: "#9E9E9E"),
    MaterialColor(name: "Blue Grey", hex: "#607D8B")
]

class PrimaryColorViewController: UIViewController {

    lazy var nextButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(tappedNext))
        button.isEnabled = false
        return button
    }()
    
    lazy var layout: UICollectionViewLayout = {
        var itemSize = self.view.frame.width / 3.0
        itemSize -= 14
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Primary Color"
        navigationItem.rightBarButtonItem = nextButton
        
        view.addSubview(collectionView)
    }
    
    func tappedNext() {
        
    }

}

extension PrimaryColorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MaterialColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        guard indexPath.row < MaterialColors.count else {
            return cell
        }
        
        let materialColor = MaterialColors[indexPath.row]
        cell.backgroundColor = UIColor(hexString: materialColor.hex)
        return cell
    }
}

extension PrimaryColorViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard indexPath.row < MaterialColors.count else {
            return
        }
        
        let materialColor = MaterialColors[indexPath.row]
        let selectedCell = collectionView.cellForItem(at: indexPath)

        UIView.animate(withDuration: 0.5) {
            self.navigationController?.navigationBar.barTintColor = UIColor(hexString: materialColor.hex)
            self.navigationController?.navigationBar.barStyle = materialColor.barStyle
            
            self.navigationController?.navigationBar.layoutIfNeeded()
            self.setNeedsStatusBarAppearanceUpdate()

            
            for cell in collectionView.visibleCells {
                if cell != selectedCell {
                    cell.backgroundColor = UIColor.lightGray
                }
            }
        }
        
        nextButton.isEnabled = true
    }
}




extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
