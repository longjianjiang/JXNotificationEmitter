//
//  ViewController.swift
//  JXNotificationEmitter
//
//  Created by zl on 2018/9/25.
//  Copyright © 2018年 longjianjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userInfo = ["key": "value"]
        JXNotificationEmitter.sharedInstance.post(name: NotificationConstants.kTestNotification, object: nibName, userInfo: userInfo)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        JXNotificationEmitter.sharedInstance.removeObserverWith(name: NotificationConstants.kTestNotification)
    }

}

