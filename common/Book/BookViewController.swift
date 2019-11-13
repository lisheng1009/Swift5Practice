//
//  BookViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/09.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        title = "scrollview"
        
        let code = UIButton()
        code.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        code.center = CGPoint(x: view.center.x - 100, y: view.center.y)
        code.setTitle("纯代码", for: .normal)
        code.addTarget(self, action: #selector(BookViewController.code), for: .touchUpInside)
        view.addSubview(code)
        
        let ib = UIButton()
        ib.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        ib.center = CGPoint(x: view.center.x + 100, y: view.center.y)
        ib.setTitle("storyboard", for: .normal)
        ib.addTarget(self, action: #selector(BookViewController.ib), for: .touchUpInside)
        view.addSubview(ib)
        
    }
    
    @objc func code(){
        navigationController?.pushViewController(codeScrollViewController(), animated: true)
    }
    
    @objc func ib(){
        navigationController?.pushViewController(storyBoardViewController(), animated: true)
    }

}
