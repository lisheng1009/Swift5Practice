
//snapkit prac
import UIKit
import SnapKit

class HeaderView: UITableViewHeaderFooterView {
    
    var showBasic : (() -> ())?
    var showAdv : (() -> ())?
    
    override func draw(_ rect: CGRect) {
        
        let btn1 = UIButton()
        btn1.setTitle("basic", for: .normal)
        btn1.addTarget(self, action: #selector(basic(button:)), for: .touchUpInside)
        btn1.sizeToFit()
        addSubview(btn1)
        
        contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        let btn2 = UIButton()
        btn2.setTitle("advanced", for: .normal)
        btn2.addTarget(self, action: #selector(basic(button:)), for: .touchUpInside)
        btn2.sizeToFit()
        addSubview(btn2)
        
        btn1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).offset(100)
        }
        
        btn2.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.trailing.equalTo(self).offset(-100)
        }
        
    }
    
    @objc func basic (button:UIButton){
        print(button.titleLabel!.text!)
        
        if button.titleLabel!.text! == "advanced" {
            if self.showAdv != nil {
                self.showAdv?()
            }
        }else{
            if self.showBasic != nil {
                self.showBasic?()
            }
        }
        
        
        
    }
    
    
    
}
