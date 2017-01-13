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

    enum State {
        case initial
        case selected
    }
    
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
    
    // MARK: Properties
    
    var state: State = .initial {
        didSet {
            
        }
    }
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.state = .initial
        
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
        return MaterialColor.primaryColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MaterialColorCell {
            guard indexPath.row < MaterialColor.primaryColors.count else {
                return cell
            }
            
            let color = MaterialColor.primaryColors[indexPath.row]
            cell.color = color
            return cell
        } else {
            //TODO: Throw error or something here, bring it to our attention!
            return UICollectionViewCell()
        }
    }
    
    private func cellFor(materialColor: MaterialColor) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

class MaterialColorCell: UICollectionViewCell {
    
    var color: MaterialColor = MaterialColor(name: "Red", hex: "#F44336") {
        didSet {
            self.backgroundColor = color.uiColor
        }
    }
}

// MARK: - UICollectionViewDelegate
extension PrimaryColorViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard indexPath.row < MaterialColor.primaryColors.count else {
            return
        }
        
        transition(from: .initial, to: .selected, fromSelectingIndexPath: indexPath)
    }
    
    // MARK: Private functions
    
    private func transition(from fromState: State, to toState: State, fromSelectingIndexPath indexPath: IndexPath) {
     
        if let cell = collectionView.cellForItem(at: indexPath) as? MaterialColorCell {
            let materialColor = MaterialColor.primaryColors[indexPath.row]
            
            // case of .initial to .selected
            UIView.animate(withDuration: 0.5) {
                self.colorNavigationBar(withMaterialColor: materialColor)
                self.colorVisibleCellsExcept(cell: cell)
            }
            nextButton.isEnabled = true
            
            // case of .selected to .initial
        }
    }
    
    private func colorVisibleCellsExcept(cell: MaterialColorCell) {
        for visibleCells in self.collectionView.visibleCells {
            if visibleCells != cell {
                //the cell's state should simply be set and everything else happens magically :)
                visibleCells.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    private func colorNavigationBar(withMaterialColor materialColor: MaterialColor) {
        self.navigationController?.navigationBar.barTintColor = materialColor.uiColor
        self.navigationController?.navigationBar.barStyle = materialColor.barStyle
        
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
}
