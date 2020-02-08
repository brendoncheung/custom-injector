//
//  Item.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/30/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
    
    convenience init(title: String, detail: String) {
        self.init()
        self.title = title
        self.detail = detail
    }
}
