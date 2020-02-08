//
//  ItemRepository.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/30/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation
import RealmSwift

protocol ItemRepository {
    func getItem() -> Results<Item>
    func add(item: Item)
}

class ItemRepositoryImpl: ItemRepository {
    
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }

    func getItem() -> Results<Item> {
        
        let items = realm.objects(Item.self)
        
        return items
    }

    func add(item: Item) {
        
        try! realm.write {
            realm.add(item)
        }
    }
}



