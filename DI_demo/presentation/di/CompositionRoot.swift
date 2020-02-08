//
//  CompositionRoot.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/30/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation
import RealmSwift

class CompositionRoot {
    
    // MARK: - Realm config
    
    func provideRealmConfiguration() -> Realm.Configuration {
        
        let config = Realm.Configuration()
        
        // configure file
        
        return config
    }
    
    func provideRealm() -> Realm {
        
        let realm = try! Realm()
        
        Realm.Configuration.defaultConfiguration = provideRealmConfiguration()
        print("Initializing local db at: \(String(describing: realm.configuration.fileURL))")
        return realm
        
    }
    
    // MARK: - Repository
    
    func provideItemRepository() -> ItemRepository {
        
        // local persistence
        return FirebaseRepository()
        
        return ItemRepositoryImpl(realm: provideRealm())
    }
    
    // MARK: - UseCase
    
    func provideAddItemUseCase() -> AddItemUseCase {
        return AddItemUseCase(repository: provideItemRepository())
    }
    
    func provideGetItemUseCase() -> GetItemsUseCase {
        return GetItemsUseCase(repository: provideItemRepository())
    }
    
    // MARK: - Interactor
    
    func provideItemViewControllerInteractor() -> ItemViewControllerInteractor {
        
        return ItemViewControllerInteractor(getItemUseCase: provideGetItemUseCase(),
                                            addItemUseCase: provideAddItemUseCase())
    }
}

class FirebaseRepository: ItemRepository {
    
    func getItem() -> Results<Item> {
        
        print("fetching items from firebase")
        
        return try! Realm().objects(Item.self)
    }
    
    func add(item: Item) {
        print("inserting items into firebase")
        
    }
}

