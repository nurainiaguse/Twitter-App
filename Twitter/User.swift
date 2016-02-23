//
//  User.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/15/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

var _currentUser: User?

class User: NSObject {
    var name: String?
    var screenname: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        
    }
    
    static var _currentUser: User?
    
    class var currentUser: User?{ // user may or may not exist
        get{
            if _currentUser == nil {
                let defaults = NSUserDefaults.standardUserDefaults()
        
                let userData = defaults.objectForKey("currentUser") as? NSData
        
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.dataWithJSONObject(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
        
            }
            return _currentUser
        }
        set(user){ //saves the user
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary, options: [])
                defaults.setObject(data, forKey: "currentUser")
            } else {
                defaults.setObject(nil, forKey: "currentUser")
                
            }
            user?.dictionary
            
            defaults.setObject(user, forKey: "currentUser")
            
            defaults.synchronize()
        }
    }
}
