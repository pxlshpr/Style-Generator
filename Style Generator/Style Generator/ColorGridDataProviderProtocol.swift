//
//  ColorGridDataProviderProtocol.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 4/2/17.
//  Copyright © 2017 Ahmed Khalaf. All rights reserved.
//

import UIKit
import RealmSwift

protocol ColorGridDataProviderProtocol: UICollectionViewDataSource {
  var realm: Realm? { get }
  weak var collectionView: UICollectionView! { get set }
  
  func addColor(color: Color)
  func fetch()
}
