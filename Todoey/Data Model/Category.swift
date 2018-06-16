//
//  Category.swift
//  Todoey
//
//  Created by Andres Quintero on 6/9/18.
//  Copyright © 2018 Andres Quintero. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    let items = List<Item>() //Category has many items, 
}
