//
//  ViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkTool.requestData(urlString: "http://m2.qiushibaike.com/article/list/imgrank", type: MethodType.GET, paras: ["page" : 2, "count" : 20]) { (res) in
            print("________")
            print(res)
            
//            if items as [Any] {
//                let items = res["items"]
//            }
            
            
            
            
        }
        
    }


}

