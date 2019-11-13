//
//  DoneViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/09.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {

    let collectionCellId = "collectionCellId"
    let collectionHeaderId = "collectionHeaderId"
    let collectionFooterId = "collectionFooterId"
    var collectionview: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "collectionview"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "storyBoard", style: .plain, target: self, action: #selector(toIb))
        
        //collectionview基础
        let flowLayout = UICollectionViewFlowLayout()
        collectionview = UICollectionView(frame: view.bounds, collectionViewLayout:flowLayout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellId)
        collectionview?.backgroundColor = UIColor.lightGray
        view.addSubview(collectionview!)
        
        
        flowLayout.itemSize = CGSize(width: 40, height: 40)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        
        //+ 边框
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        //+ 头部尾部
        flowLayout.headerReferenceSize = CGSize(width: view.bounds.width, height: 80)
        flowLayout.footerReferenceSize = CGSize(width: view.bounds.width, height: 80)
        collectionview?.register(CollectionHeaderView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: collectionHeaderId)
        collectionview?.register(CollectionFooterView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: collectionFooterId)

    }
    
    @objc func toIb(){
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
}


extension DoneViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath)
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor(red: CGFloat(indexPath.row) / 25.5, green: 0, blue: 0, alpha: 0.5)
        }else{
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: CGFloat(indexPath.row) / 25.5, alpha: 0.5)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    //+ 头尾
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                
        if kind == "UICollectionElementKindSectionHeader" {
            let headerView: CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: collectionHeaderId, for: indexPath) as! CollectionHeaderView
            headerView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            headerView.textLabel.text = "HeaderView - section \(indexPath.section)"
            headerView.textLabel.sizeToFit()
            return headerView
        }else{
            let footerView: CollectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: collectionFooterId, for: indexPath) as! CollectionFooterView
            footerView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            footerView.textLabel.text = "footerView - section \(indexPath.section)"
            footerView.textLabel.sizeToFit()
            return footerView
        }
        
    }
    
}


extension DoneViewController: UICollectionViewDelegate{
    
}
