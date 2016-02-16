//
//  TwitterClient.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/13/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "r5az4ZmbGqQobxHjAxHf37uNB"
let twitterConsumerSecret = "aJxNQu4DM2RyhqrpPvVuqi0vQy6moc5nuqRht8pPFJ4YvhJPCg"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {

    var loginCompletion: ((user: User?, error: NSError?)-> ())?
    
    class var sharedInstance: TwitterClient{
        struct Static{
            static let instance =
            TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret)
            
        }
        return Static.instance
    }
    
    func openURL(url: NSURL){
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential (queryString:url.query),
            success: {(accessToken: BDBOAuth1Credential!) -> Void in
                TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
                
                TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: {
                    (operation: NSURLSessionDataTask?, response: AnyObject?) -> Void in
                    //print("user: \(response)")
                    var user = User(dictionary: response as! NSDictionary)
                    print("user: \(user.name)\n")
                    self.loginCompletion?(user: user, error: nil)
                    }, failure: {
                        (operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                        self.loginCompletion?(user: nil, error: error)
                    }
                    
                )
                TwitterClient.sharedInstance.GET("1.1/statuses/home_timeline.json", parameters: nil, success: {
                    (operation: NSURLSessionDataTask?, response: AnyObject?) -> Void in
                    //print("home timeline: \(response)")
                    }, failure: {
                        (operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                    }
                    
                )
                
            }, failure:  {(error: NSError!) -> Void in
                self.loginCompletion?(user: nil, error: error)
        })

        
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?)-> ()){
        loginCompletion = completion
        
        //Fetch request token and redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: {(requestToken: BDBOAuth1Credential!) -> Void in
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            }) {(error: NSError!) -> Void in
                // there is an error
                self.loginCompletion?(user: nil, error: error)
                
        }

    }

}
