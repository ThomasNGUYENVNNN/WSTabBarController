//
//  AppDelegate.swift
//  WSTabBarController-Sample
//
//  Created by chisj on 16/4/27.
//  Copyright © 2016年 WS. All rights reserved.
//

import UIKit
import WSTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    var maintabbarController : WSTabBarController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.whiteColor()
        window!.makeKeyAndVisible()
        
        maintabbarController = WSTabBarController(publishButtonConfig: {b in
            b.setImage(UIImage(named: "post_normal"), forState: .Normal)
            b.setImage(UIImage(named: "post_normal"), forState: .Highlighted)
            b.frame = CGRectMake(0, 0, 64, 77)
            b.setTitle("publish", forState: .Normal)
            b.contentVerticalAlignment = .Top
            b.titleEdgeInsets = UIEdgeInsets(top: 60, left: -64, bottom: 0 , right: 0)
            b.titleLabel?.font = UIFont.systemFontOfSize(11)
            
            b.setTitleColor(UIColor.blackColor(), forState: .Normal)
            b.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
            }, publishButtonClick: { p in print("publish button clicked")})
        maintabbarController?.tabBar.translucent = false;
        maintabbarController?.tabBar.tintColor =  UIColor.orangeColor()
        
        maintabbarController?.viewControllers = [controller(title: "tab1", icon: "tabbar_main"),
                                                 controller(title: "tab2", icon: "tabbar_main"),
                                                 controller(title: "tab3", icon: "tabbar_mine"),
                                                 controller(title: "tab4", icon: "tabbar_mine")
                                                 ]
        window!.rootViewController = maintabbarController
        return true
    }
    
    func controller(title title: String, icon: String) -> UINavigationController {
        let c = UIViewController()
        c.title = title
        let controller = UINavigationController(rootViewController:c)
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: icon)
        return controller
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

