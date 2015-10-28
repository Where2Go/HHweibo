//
//  AppDelegate.swift
//  HHWeibo
//
//  Created by 房凯 on 15/10/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UINavigationBar.appearance().tintColor=UIColor.orangeColor()
        
        window=UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let tabbarVc=HHMainViewController()
        
        window?.rootViewController = tabbarVc
        
        window?.makeKeyAndVisible() 
        
        
        return true
    }

   

}

