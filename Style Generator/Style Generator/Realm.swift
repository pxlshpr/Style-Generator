//
//  Realm.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 3/2/17.
//  Copyright © 2017 Ahmed Khalaf. All rights reserved.
//

import Foundation
import RealmSwift

func deleteAllRealmData() {
  let realm = try! Realm()
  try! realm.write {
    realm.deleteAll()
  }
}
