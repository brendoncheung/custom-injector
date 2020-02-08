//
//  ItemViewControllerInteractor.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/29/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation
import RealmSwift

class ItemViewControllerInteractor {
    
    private let getItemUseCase: GetItemsUseCase
    private let addItemUseCase: AddItemUseCase
    
    private weak var presenter: ItemViewControllerPresenter?
    
    // MARK: - Cache
    private var itemsCached: Results<Item>?
    
    init(getItemUseCase: GetItemsUseCase,
         addItemUseCase: AddItemUseCase) {
        self.getItemUseCase = getItemUseCase
        self.addItemUseCase = addItemUseCase
    }
    
    func onStart() {
        getItemAndCache()
        presenter?.showItems(items: itemsCached!)
    }
    
    // This would be a method injection because this dependency can only
    // be determined at runtime
    func bindPresenter(presenter: ItemViewControllerPresenter) {
        self.presenter = presenter
    }
    
    private func getItemAndCache() {
        itemsCached = getItemUseCase.getItems()
    }
    
    func addItem(item: Item) {
        addItemUseCase.addItem(item: item)
        presenter?.showItems(items: itemsCached!)
    }
    
    func getItemAt(position: Int) -> Item {
        return itemsCached![position]
    }
    
    func onStop() {
        
    }
    
    func numberOfItems() -> Int {
        
        guard let cached = itemsCached  else {
            return 0
        }
        return cached.count
    }
}
