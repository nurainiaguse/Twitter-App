//
//  AppDelegate.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/13/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit
import AFNetworking
import BDBOAuth1Manager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if User.currentUser != nil{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("tabBarNavController")
            window?.rootViewController = vc

           /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let timelineNavController = storyboard.instantiateViewControllerWithIdentifier("TimelineNavigationController") as! UINavigationController
            
            let timelineViewController = timelineNavController.topViewController as! TimelineViewController
            
            let homepageNavController = storyboard.instantiateViewControllerWithIdentifier("TimelineNavigationController") as! UINavigationController
            
            let homepageViewController = homepageNavController.topViewController as! HomepageViewController
            
            let tabBar = UITabBarController()
            tabBar.viewControllers = [timelineNavController, homepageNavController]
            window?.rootViewController = tabBar
            window?.makeKeyAndVisible()
            */
            
        }
        NSNotificationCenter.defaultCenter().addObserverForName(User.userDidLogoutNotification, object: nil, queue: NSOperationQueue.mainQueue()){(NSNotification) -> Void in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            
            self.window?.rootViewController = vc
        }

        // Override point for customization after application launch.
        return true
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

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        //let client = TwitterClient.sharedInstance
        //client.handleOpenUrl(url)
        TwitterClient.sharedInstance.handleOpenUrl(url)
  /*
        client.homeTimeline({(tweets: [Tweet]) -> () in
            
            }, failure: {( error: NSError) -> () in
                
            })
        client.currentAccount({(user: User) -> () in
            
            }, failure: {( error: NSError) -> () in
                
        })
*/
        
                return true
    }


}

