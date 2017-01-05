//
//  ViewController.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 14/12/16.
//  Copyright © 2016 Ahmed Khalaf. All rights reserved.
//

import UIKit
import Toolbelt

class PrimaryColorViewController: UIViewController {

    // MARK: Lazy Properties
    
    lazy var nextButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(tappedNext))
        button.isEnabled = false
        return button
    }()
    
    lazy var layout: UICollectionViewLayout = {
        
        //TODO: remove constants

        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)

        let width = 122.0
        print(width)
        layout.itemSize = CGSize(width: width, height: width)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MaterialColorCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Primary Color"
        navigationItem.rightBarButtonItem = nextButton
        
        view.addSubview(collectionView)
    }
    
    // MARK: Actions
    
    func tappedNext() {
        
    }
}

// MARK: - UICollectionViewDataSource
extension PrimaryColorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MaterialColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MaterialColorCell
        
        guard indexPath.row < MaterialColors.count else {
            return cell
        }
        
        let color = MaterialColors[indexPath.row]
        cell.color = color
        return cell
    }
    
    private func cellFor(materialColor: MaterialColorStruct) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

class MaterialColorCell: UICollectionViewCell {
    
    var color: MaterialColorStruct = MaterialColorStruct.red {
        didSet {
            self.backgroundColor = UIColor(hexString: color.hex)
        }
    }
}

// MARK: - UICollectionViewDelegate
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
