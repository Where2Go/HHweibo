//
//  HHVistorView.swift
//  HHWeibo
//
//  Created by 房凯 on 15/10/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit
//这里的protocol是小写
protocol HHVistorViewDelegate : NSObjectProtocol {
    func vistorViewRegistClick()
    func vistorViewLoginClick()
}

class HHVistorView: UIView {
    
    weak var vistorViewDelegate:HHVistorViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        prepareUI()
    }

    

    func prepareUI(){
        
        backgroundColor = UIColor(white: 237.0 / 255, alpha: 1)

        
        //添加子控件
        addSubview(iconView)
        addSubview(coverView)

        addSubview(homeView)
        addSubview(messageLable)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //设置约束
        coverView.translatesAutoresizingMaskIntoConstraints=false
        iconView.translatesAutoresizingMaskIntoConstraints=false
        homeView.translatesAutoresizingMaskIntoConstraints=false
        messageLable.translatesAutoresizingMaskIntoConstraints=false
        registerButton.translatesAutoresizingMaskIntoConstraints=false
        loginButton.translatesAutoresizingMaskIntoConstraints=false
        
        
        //遮盖约束
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: registerButton, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        
        
        //转轮约束
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -40))
        
        //房子约束
        addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        
        //消息Label
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))
        
        //注册button
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 15))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 30))
        
        //登录button
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 15))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 30))
        

    }
    
    /**
    设置其他几个控制器的访客视图
    */
    func setupVistorView(imageName:String,message:String){
        //其他几个控制器没有homeView
        homeView.hidden=true
        iconView.image=UIImage(named: imageName)
        messageLable.text=message
        self.sendSubviewToBack(coverView)
    }
    
 /// 设置滚轮动画
    func startRotationAnimation(){
        let animation=CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue=2*M_PI
        animation.repeatCount=MAXFLOAT
        animation.duration=20
        
        animation.removedOnCompletion=false
        
        iconView.layer.addAnimation(animation, forKey: "homeRotation")
    }
    
    /// 暂停旋转
    func pauseAnimation() {
        // 记录暂停时间
        let pauseTime = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        
        // 设置动画速度为0
        iconView.layer.speed = 0
        
        // 设置动画偏移时间
        iconView.layer.timeOffset = pauseTime
    }
    
    /// 恢复旋转
    func resumeAnimation() {
        // 获取暂停时间
        let pauseTime = iconView.layer.timeOffset
        
        // 设置动画速度为1
        iconView.layer.speed = 1
        
        iconView.layer.timeOffset = 0
        
        iconView.layer.beginTime = 0
        
        let timeSincePause = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime
        
        iconView.layer.beginTime = timeSincePause
    }
    
    // MARK: -懒加载
    //转轮
    private lazy var iconView:UIImageView={
        let imageView=UIImageView()
        let image=UIImage(named: "visitordiscover_feed_image_smallicon")
        imageView.image=image
        imageView.sizeToFit()
       return imageView
    }()
   
    //房子
    private lazy var homeView:UIImageView={
        let imageView=UIImageView()
        let image=UIImage(named: "visitordiscover_feed_image_house")
        imageView.image=image
        
        return imageView
    }()
    
    //消息文字
    private lazy var messageLable:UILabel={
        let label=UILabel()
        label.text="尽快尽快是电话费的塑料下"
        label.textColor=UIColor.lightGrayColor()
        label.numberOfLines=0
        label.sizeToFit()
        return label
    }()
    
    //注册按钮
    private lazy var registerButton:UIButton={
        let button=UIButton()
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        button.sizeToFit()
        button.addTarget(self, action: "registClick", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }()
    
    func registClick(){
        vistorViewDelegate?.vistorViewRegistClick()
    }
    
    
    //登陆按钮
    private lazy var loginButton:UIButton={
        let button=UIButton()
        button.setTitle("登录", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        button.addTarget(self, action: "loginClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    func loginClick(){
        vistorViewDelegate?.vistorViewRegistClick()
    }
    
    //遮盖
    private lazy var coverView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    

    

}
