//
//  User.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/15/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: NSString?
    var screenname: NSString?
    var profileImageUrl: NSURL?
    var tagline: NSString?
    var dictionary: NSDictionary?
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profileImageUrl = NSURL(string: profileUrlString)
            
        }else {
            profileImageUrl = nil
        }
        //profileImageUrl = dictionary["profile_image_url"] as? NSURL
        tagline = dictionary["description"] as? String
        
    }
    
    static var _currentUser: User?
    
    class var currentUser: User?{ // user may or may not exist
        get{
            //if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            let userData = defaults.objectForKey("currentUserData") as? NSData
            if let userData = userData{
            let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                _currentUser = User(dictionary: dictionary)
            }
            return _currentUser
        
        //    }
         //   return _currentUser
        }
        set(user){ //saves the user
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
                
            }
           // user?.dictionary
            
           // defaults.setObject(user, forKey: "currentUserData")
            
            defaults.synchronize()
        }
    }
}
