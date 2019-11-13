//
//  VideoViewController.swift
//  common
//
//  Created by 安静清晨 on 2019/11/12.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {

    var palyerItem: AVPlayerItem?
    var player: AVPlayer?
    let urlString: String = "http://qiubai-video.yitxf.net/article/gif/CMHQG4VDUISKLMQ2_3g.mp4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        //创建媒体资源管理对象
         self.palyerItem = AVPlayerItem(url: NSURL(string: urlString)! as URL)
         //创建ACplayer：负责视频播放
         self.player = AVPlayer.init(playerItem: self.palyerItem)
        self.player!.rate = 1.0//播放速度 播放前设置
         //创建显示视频的图层
         let playerLayer = AVPlayerLayer.init(player: self.player)
         playerLayer.videoGravity = .resizeAspect
         playerLayer.frame = self.view.bounds
         self.view.layer .addSublayer(playerLayer)
         //播放
        self.player!.play()
        
        //暂停按钮
        let btn1 = UIButton()
        btn1.setTitle("暂停", for: .normal)
        btn1.setTitle("播放", for: .selected)
        btn1.addTarget(self, action: #selector(pauseButtonSelected(sender:)), for: .touchUpInside)
        btn1.frame = CGRect(x: 20, y: 120, width: 80, height: 40)
        btn1.sizeToFit()
        view.addSubview(btn1)
        
    }
    

    @objc func pauseButtonSelected(sender:UIButton)  {
         sender.isSelected = !sender.isSelected
         if sender.isSelected{
            self.player?.pause()
         }else{
            self.player?.play()
         }
     }
}
