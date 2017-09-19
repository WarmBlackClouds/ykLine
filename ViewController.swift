//
//  ViewController.swift
//  YKLineStream
//
//  Created by 许 振辉 on 2017/7/5.
//  Copyright © 2017年 许 振辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var live: YKCell!
    //定义一个播放的容器
    var playView:UIView!
    var ijkPlayer:IJKMediaPlayback!
    
    
    @IBOutlet var btnback: UIButton!
    @IBOutlet var btnlike: UIButton!
    @IBOutlet var imgback: UIImageView!
    
    @IBAction func tapBack(_ sender: Any) {
        //在后退之前把播放器关掉
        ijkPlayer.shutdown()
        //返回第一个界面
        navigationController?.popViewController(animated: true)
        //在把导航栏显示出来
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func tapLike(_ sender: Any) {
        
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        heart.center = CGPoint(x: btnlike.frame.origin.x + 15, y: btnlike.frame.origin.y)
        
        view.addSubview(heart)
        heart.animate(in: view)
        
        //按住爱心大小关键帧变化动画
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
        btnAnime.keyTimes = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        btnAnime.duration = 0.2
        (sender as AnyObject).layer.add(btnAnime,forKey:"SHOM")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //测试->把传递来的live打印到控制台
        dump(live)
        
        //设置背景图虚化主播头像
        setBg()
        //播放视频
        setPlayView()
        //显示按钮
        bringbtnToFront()
        
        
    }
    
    func setPlayView(){
        //视频的框架
        //初始化空白容器
        self.playView = UIView(frame: view.bounds)
        view.addSubview(self.playView)
        //初始化ijk
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        pv.frame = playView.bounds
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill
        
    }

    //所有视图加载完毕
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //判断是否在播放
        if !self.ijkPlayer.isPlaying(){
            ijkPlayer.prepareToPlay()
        }
    }
    
    func setBg(){
        let imgUrl = URL(string: live.portrait)
        imgback.kf.setImage(with: imgUrl)
        //虚化
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = imgback.bounds //虚化的大小为图片的大小
        imgback.addSubview(effectView)
    }
    //把按钮显示在虚化的图片上面
    func bringbtnToFront(){
        view.bringSubview(toFront: btnback)
        view.bringSubview(toFront: btnlike)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

