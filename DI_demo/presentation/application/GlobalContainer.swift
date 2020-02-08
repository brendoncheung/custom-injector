//
//  GlobalContainer.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 2/2/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation

protocol GlobalContainer {
    func provideGlobalInstance<T, Metatype>(of value: T) -> Metatype
}

class GlobalContainerImpl: GlobalContainer {
    
    func provideGlobalInstance<T, Metatype>(of value: T) -> Metatype {
        // global caching instances
        fatalError("service not set up yet")
    }

    
}
