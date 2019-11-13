//
//  ListModel.swift
//  common
//
//  Created by 安静清晨 on 2019/11/10.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class ListModel: NSObject {

    @objc var room_name : String = ""
    @objc var avatar_small : String = ""
    @objc var room_src : String = ""

    init(dict:[String : NSObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
