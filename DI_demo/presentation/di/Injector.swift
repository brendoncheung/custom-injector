//
//  Injector.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/30/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation

class Injector {
    
    private let root: CompositionRoot
    
    init(root: CompositionRoot) {
        self.root = root
    }
    
    func inject(ItemViewController: ItemViewController) {
        let interactor = root.provideItemViewControllerInteractor()
        ItemViewController.interactor = interactor
        
    }
    
}
