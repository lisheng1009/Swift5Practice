//
//  HotCateModel.swift
//  common
//
//  Created by 安静清晨 on 2019/11/10.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class HotCateModel: NSObject {
    
    @objc var tag_name: String = ""
    @objc var icon_name: String = "home_header_normal"
    @objc var small_icon_url: String = ""
    @objc var room_list:[ListModel]?
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
