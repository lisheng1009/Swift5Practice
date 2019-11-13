//
//  CollectionFooterView.swift
//  common
//
//  Created by 安静清晨 on 2019/11/09.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class CollectionFooterView: UICollectionReusableView {
    
    lazy var textLabel = UILabel()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(textLabel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
