//
//  ViewController.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 14/12/16.
//  Copyright © 2016 Ahmed Khalaf. All rights reserved.
//

import UIKit
import Toolbelt

class PrimaryColorViewController: ColorViewController {
   
    //TODO: we want a 'colors' variable that will have an array of things that conform to a protocl that encapsulates both MaterialColors and any other generic color objects we may create, by having a name and a uiColor at least for instance. This will be the only parameter for this class for now, I suppose. We can add more as go along – like if a preview is displayed when a selection is made and whether this color is linked to the primary / accent or text, just so we can make some semantic context out of it.
//    var colors: [ //]
}

class ColorViewController: UIViewController {

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
    
    var selectedIndexPath: IndexPath?
    
    var defaultNavigationBarTintColor: UIColor?
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.state = .initial
        
        navigationItem.title = "Primary Color"
        navigationItem.rightBarButtonItem = nextButton
        defaultNavigationBarTintColor = self.navigationController?.navigationBar.barTintColor
        
        view.addSubview(collectionView)
    }
    
    // MARK: Actions
    
    func tappedNext() {
        
    }
}

// MARK: - UICollectionViewDataSource
extension ColorViewController: UICollectionViewDataSource {
    
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
    
    private func cellFor(materialColor: MaterialColor) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension ColorViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard indexPath.row < MaterialColor.primaryColors.count else {
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
     
        if let cell = collectionView.cellForItem(at: indexPath) as? MaterialColorCell {
            let materialColor = MaterialColor.primaryColors[indexPath.row]
            
            switch toState {
            case .initial:
                animateBeforeReloadingCollectionView {
                    self.colorNavigationBar(withMaterialColor: nil)
                    self.resetVisibleCells()
                }
                
                navigationItem.title = "Primary Color"
                nextButton.isEnabled = false
                nextButton.tintColor = .black
                selectedIndexPath = nil
                state = .initial
            case .selected:
                animateBeforeReloadingCollectionView {
                    self.colorNavigationBar(withMaterialColor: materialColor)
                    self.colorVisibleCellsExcept(cell: cell)
                }
                
                navigationItem.title = materialColor.name
                nextButton.isEnabled = true
                nextButton.tintColor = materialColor.barStyle == .black ? .white : .black
                selectedIndexPath = indexPath
                state = .selected
            }
        }
    }
    
    private func colorVisibleCellsExcept(cell: MaterialColorCell) {
        if let visibleCells = self.collectionView.visibleCells as? [MaterialColorCell] {
            for visibleCell in visibleCells {
                visibleCell.state = visibleCell == cell ? .selected : .deselected
            }
        }
    }
    
    private func resetVisibleCells() {
        if let visibleCells = self.collectionView.visibleCells as? [MaterialColorCell] {
            for visibleCell in visibleCells {
                visibleCell.state = .initial
            }
        }
    }

    
    private func colorNavigationBar(withMaterialColor materialColor: MaterialColor?) {
        if let controller = self.navigationController {
            if let color = materialColor {
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
