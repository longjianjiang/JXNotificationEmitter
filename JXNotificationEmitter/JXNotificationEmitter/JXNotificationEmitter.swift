//
//  JXNotificationEmitter.swift
//  JXNotificationEmitter
//
//  Created by zl on 2018/9/25.
//  Copyright © 2018年 longjianjiang. All rights reserved.
//

import UIKit

class JXNotificationEmitter {
    static let sharedInstance = JXNotificationEmitter()
    private var observerMap = [String: Any]()
    
    private init() {}
    
    open func post(name aName: String) {
        post(name: aName, object: nil, userInfo: nil)
    }
    open func post(name aName: String, object anObject: Any) {
        post(name: aName, object: anObject, userInfo: nil)
    }
    open func post(name aName: String, object anObject: Any?, userInfo aUserInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: aName), object: anObject, userInfo: aUserInfo)
        
        print("[JXNotificationEmitter]=> post one notification <\(aName)>")
    }
    
    open func removeObserverWith(name aName: String) {
        removeObserverWith(name: aName, object: nil)
    }
    open func removeObserverWith(name aName: String, object anObject: Any?) {
        guard let observer = observerMap[aName] else {
            print("[JXNotificationEmitter]=> remove observer with notification <\(aName)> failed, cause notification invalid")
            return
        }
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: aName), object: anObject)
        observerMap.removeValue(forKey: aName)
        
        print("[JXNotificationEmitter]=> remove observer with notification <\(aName)> success")
    }
    
    open func addObserver(forName aName: String,
                     using callback: @escaping (Notification) -> Void,
                     object anObject: Any? = nil,
                     queue: OperationQueue? = OperationQueue.main) {
        
        let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: aName), object: anObject, queue: queue) { (noti) in
            callback(noti)
        }
        observerMap[aName] = observer
    }
}
