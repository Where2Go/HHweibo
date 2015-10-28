//
//  HHMainViewController.swift
//  HHWeibo
//
//  Created by 房凯 on 15/10/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class HHMainViewController: UITabBarController {
    
    func composeClick(){
        print(__FUNCTION__)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor=UIColor.orangeColor()
        
        let homeVc=HHHomeViewController()
        addChildViewController(homeVc, title: "首页", imgName: "tabbar_home")
        
        let messageVc=HHMessageViewController()
        addChildViewController(messageVc, title: "消息", imgName: "tabbar_message_center")
        
        let composeVc=UIViewController()
        addChildViewController(composeVc, title: "", imgName: "ss")
        composeVc.view.backgroundColor=UIColor.whiteColor() 
        
        // 发现
        let discoverVC = HHDiscoverViewController()
        self.addChildViewController(discoverVC, title: "发现", imgName: "tabbar_discover")
        
        // 我
        let profileVC = HHProfileViewController()
        self.addChildViewController(profileVC, title: "我", imgName: "tabbar_profile")
        
        

    }
    
    private func addChildViewController(childController: UIViewController,title:String,imgName:String) {
        childController.title=title
        childController.tabBarItem.image=UIImage(named: imgName)
        
        addChildViewController(UINavigationController(rootViewController: childController))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let width=tabBar.bounds.width/CGFloat(5)
        composeButton.frame=CGRect(x: width*2, y: 0, width: width, height: tabBar.bounds.height)
        
        tabBar.addSubview(composeButton)
    }
    
    
    lazy var composeButton:UIButton={
        let button=UIButton()
        
        //
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        button.addTarget(self, action: "composeClick", forControlEvents: UIControlEvents.TouchUpInside)

        return button
        
    }()
    

   

  

}
