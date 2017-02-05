//
//  ColorGridDataProvider.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 4/2/17.
//  Copyright © 2017 Ahmed Khalaf. All rights reserved.
//

import UIKit
import RealmSwift

public class ColorGirdDataProvider: NSObject, ColorGridDataProviderProtocol {
  
  var realm: Realm?
  weak var collectionView: UICollectionView!

  func addColor(color: Color) {
    //Todo
  }

  func fetch() {
    
  }
}

// MARK: UICollectionViewDataSource
extension ColorGirdDataProvider: UICollectionViewDataSource {

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
}
