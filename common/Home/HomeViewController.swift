//
//  HomeViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/09.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import SwiftyJSON

class HomeViewController: UIViewController {
    
    var versionIsBasic : Bool = true
    var page : Int = 1
    lazy var tableview = UITableView()
    lazy var dataArray : [HotCateModel] = [HotCateModel]()
    lazy var dataArray2 : [QiuBaiModel] = [QiuBaiModel]()

    let advString = "http://m2.qiushibaike.com/article/list/imgrank"
    let basicString = "http://capi.douyucdn.cn/api/v1/getHotCate"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
        let b1 = UIBarButtonItem(title: "Video", style: .plain, target: self, action: #selector(toIb))
        
        let b2 = UIBarButtonItem(title: "Audio", style: .plain, target: self, action: #selector(toIb))
        
        navigationItem.rightBarButtonItems = [b1,b2]
        
        //tableview最基本
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableview.frame = view.bounds
        view.addSubview(tableview)
 
        loadData()
        
        
        //tableview2
        tableview.register(UINib(nibName: "QiuBaiTableViewCell", bundle: nil), forCellReuseIdentifier: "QBCell")
        //下拉刷新
        tableview.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: self.loadMoreData)
    }
    
    @objc func toIb(){
        navigationController?.pushViewController(VideoViewController(), animated: true)
    }
    
    func advLoad(){
        NetworkTool.requestData(urlString: advString, type: .GET, paras: ["page": 1, "count" : 10]) { (respnse) in
            
            let resultDict = respnse as? [String:NSObject]
            let items = resultDict!["items"] as? [[String:NSObject]]
            for item in items! {
               let model = QiuBaiModel(dict: item)
                self.dataArray2.append(model)
                print(model.name)
                }
            self.versionIsBasic = false
            self.tableview.reloadData()
        }

    }
    
    func loadMoreData(){
        if versionIsBasic {
            return
        }
        NetworkTool.requestData(urlString: advString, type: .GET, paras: ["page": page + 1, "count" : 10]) { (respnse) in
             
             let resultDict = respnse as? [String:NSObject]
             let items = resultDict!["items"] as? [[String:NSObject]]
             for item in items! {
                let model = QiuBaiModel(dict: item)
                 self.dataArray2.append(model)
                 print(model.name)
                 }
             self.versionIsBasic = false
             self.tableview.reloadData()
             self.tableview.mj_footer.endRefreshing()
             self.page += 1
         }
    }
    
    func loadData() {
        
        NetworkTool.requestData(urlString: basicString, type: MethodType.GET, paras: ["limit" : 4, "offset" : 0, "time": 1474252024]) { (res) in
            
//            print(res)
            //guard比较好
            let resultDict = res as? [String:NSObject]
            let items = resultDict!["data"] as? [[String:NSObject]]
            for item in items! {
               let model = HotCateModel(dict: item)
                let list = item["room_list"] as! [[String : NSObject]]
                
                var tempArr:[ListModel] = [ListModel]()
                for l in list{
                    let model = ListModel(dict: l)
                    tempArr.append(model)
                }
                model.room_list = tempArr
                
                self.dataArray.append(model)
            }
//            print(self.dataArray.first?.room_list!)
            
            self.tableview.reloadData()
        }
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return versionIsBasic ? dataArray.count : dataArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if versionIsBasic {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
                
                let model = dataArray[indexPath.row]
                cell.name.text = model.tag_name
                let imageURL:URL = URL(string: model.small_icon_url)!
                let data = NSData(contentsOf: imageURL)
                cell.pic.image = UIImage(data: data! as Data)
            
                //取消点击灰色效果
                cell.selectionStyle = .none
                return cell
        }else{
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "QBCell") as! QiuBaiTableViewCell
                
                let model = dataArray2[indexPath.row]
                cell.name.text = model.name
                cell.content.text = model.content
            cell.userId.text = model.userId
                cell.selectionStyle = .none
                return cell
        }
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return versionIsBasic ? 80 : 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 80))
        header.showAdv = {
            self.versionIsBasic = false
            self.advLoad()
        }
        header.showBasic = {
            self.versionIsBasic = true
            self.tableview.reloadData()
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if versionIsBasic {
                    let model = self.dataArray[indexPath.row]
            
            let tc = ListTableViewController()
            tc.listData = model.room_list
            navigationController?.pushViewController(tc, animated: true)
        }else{
            
        }

    }
    
}
