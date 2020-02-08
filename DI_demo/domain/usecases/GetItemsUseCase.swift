//
//  GetItemsUseCase.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/29/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation
import RealmSwift

class GetItemsUseCase {
    
    private let repository: ItemRepository
    
    init(repository: ItemRepository) {
        self.repository = repository
    }
    
    func getItems() -> Results<Item> {
        return repository.getItem()
    }
 }
