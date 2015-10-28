//
//  HHBaseTableViewController.swift
//  HHWeibo
//
//  Created by 房凯 on 15/10/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

extension HHBaseTableViewController : HHVistorViewDelegate {
    func vistorViewRegistClick(){
        
    }
    func vistorViewLoginClick(){
        
    }
    
}

class HHBaseTableViewController: UITableViewController {

    
    let userLogin=false
    
    override func loadView() {
        userLogin ? super.loadView() : setupVistorView()
    }
    
    //创建访客视图
    func setupVistorView(){
        let vistorView = HHVistorView()
        view = vistorView
//        vistorView.backgroundColor=UIColor.whiteColor()
        vistorView.vistorViewDelegate=self
        
        self.navigationItem.leftBarButtonItem=UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "vistorViewRegistClick")
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action: "vistorViewLoginClick")
        
        if self is HHHomeViewController{
            vistorView.startRotationAnimation()
            
            //监听应用退到后台和进入前台
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
            
        }else if self is HHMessageViewController{
            vistorView.setupVistorView("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    


    

}
