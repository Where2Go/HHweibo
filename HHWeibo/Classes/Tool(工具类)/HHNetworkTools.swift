//
//  HHNetworkTools.swift
//  HHWeibo
//
//  Created by 房凯 on 15/10/29.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit
import AFNetworking

class HHNetworkTools: AFHTTPSessionManager  {
    
    //创建单例
    static let sharedInstance: HHNetworkTools={
        let urlString="https://api.weibo.com"
        
        let tool = HHNetworkTools(baseURL: NSURL(string: urlString))
        return tool
    }()
}
