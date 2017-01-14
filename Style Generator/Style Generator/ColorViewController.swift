//
//  ViewController.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 14/12/16.
//  Copyright © 2016 Ahmed Khalaf. All rights reserved.
//

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
    
    var colors: [MaterialColor]

    // MARK: View Lifecycle

    init() {
        self.colors = []
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(colors: [MaterialColor]) {
        self.init()
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
    }
    
    // MARK: Actions
    
    func tappedNext() {
        
        let colors = [MaterialColor.brown, MaterialColor.amber]
        let accentViewController = ColorViewController(colors: colors)
        self.navigationController?.pushViewController(accentViewController, animated: true)
        accentViewController.navigationController?.navigationBar.tintColor = self.nextButton.tintColor
    }
}

// MARK: - UICollectionViewDataSource
extension ColorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ColorCell {
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
    
    private func colorVisibleCellsExceptThatWithColor(color: MaterialColor) {
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

    
    private func colorNavigationBar(withColor color: MaterialColor?) {
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
