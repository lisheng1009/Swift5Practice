//
//  TabBarViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import Alamofire

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        tabBar.barTintColor = UIColor.white
        
        addChild("首页", "home", "home_selected", HomeViewController.self)
        
        addChild("book", "book", "book_selected", BookViewController.self)
        
        addChild("done", "done", "done_selected", DoneViewController.self)
        
        addChild("我的", "my", "my_selected", MyViewController.self)
        
        //        loadData()
    }
    
    func addChild(_ title: String,
                  _ imageName: String,
                  _ selectedImageName: String,
                  _ type: UIViewController.Type){
        
        let nav = UINavigationController(rootViewController: type.init())
        nav.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)
        
        addChild(nav)
        
    }
    
    
    
    func loadData() {
        NetworkTool.requestData(urlString: "http://m2.qiushibaike.com/article/list/imgrank", type: MethodType.GET, paras: ["page" : 2, "count" : 20]) { (res) in
            print("________")
            print(res)
            
            //            if items as [Any] {
            //                let items = res["items"]
            //            }
            
            
            
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
