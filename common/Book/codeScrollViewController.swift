//
//  codeScrollViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/09.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class codeScrollViewController: UIViewController {
    
    lazy var scroll = UIScrollView(frame: view.bounds)
    lazy var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.addSubview(scroll)
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: 0)
        for i in 0...2 {
            let iv = UIImageView(image: UIImage(named: "scroll_0\(i+1)"))
            scroll.addSubview(iv)
            iv.frame = CGRect(x: 375 * i, y: 0, width: 375, height: 667)
        }
        // 以上为最基本  必须有一个contentSize.
        
        
        
        
        //去掉边界滑动指示
        scroll.showsHorizontalScrollIndicator = false
        //分页
        scroll.isPagingEnabled = true
        //分页符
        pageControl.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        pageControl.center = CGPoint(x: view.center.x, y: view.bounds.height - 100)
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        pageControl.addTarget(self, action: #selector(changePage), for: .valueChanged)
        view.addSubview(pageControl)
        //代理
        scroll.delegate = self
    }
    
    @objc func changePage(){
        scroll.setContentOffset(CGPoint(x: Int(view.bounds.width) * pageControl.currentPage, y: 0), animated: true)
        print(pageControl.currentPage)
    }

}

extension codeScrollViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
    
}
