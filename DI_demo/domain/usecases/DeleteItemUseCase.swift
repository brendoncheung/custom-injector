//
//  DeleteItemUseCase.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/30/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation

class DeleteItemUseCase {
    
    private let repository: ItemRepository
    
    init(repository: ItemRepository) {
        self.repository = repository
    }
    
    func deleteItem(item: Item) {
        
    }
    
    
    
}
