//
//  TwitterClient.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/13/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit
import BDBOAuth1Manager



class TwitterClient: BDBOAuth1SessionManager {
 
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "r5az4ZmbGqQobxHjAxHf37uNB",
        consumerSecret: "aJxNQu4DM2RyhqrpPvVuqi0vQy6moc5nuqRht8pPFJ4YvhJPCg")

    var loginCompletion: ((user: User?, error: NSError?)-> ())?
 /*
    class var sharedInstance: TwitterClient{
        struct Static{
            static let instance =
            TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret)
            
        }
        return Static.instance
    }
    */
    var loginSuccess: (() -> ())?
    var loginFailure: ((NSError) -> ())?
    
/*    func openURL(url: NSURL){
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
  */
    func handleOpenUrl(url: NSURL){
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential (queryString:url.query),
            success: {(accessToken: BDBOAuth1Credential!) -> Void in
                self.currentAccount({ (user: User) -> () in
                    User.currentUser = user
                    self.loginSuccess?()
                    }, failure: { ( error: NSError?) -> () in
                      (self.loginFailure?(error!))
                    })
                //self.loginSuccess?()
            }) { (error: NSError!) -> Void in
                self.loginFailure?(error)
        }
        
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) -> ()){
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: {
            (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            //print("user: \(response)")
            let dicts = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dicts)
            success(tweets)
            }, failure: {
                (task: NSURLSessionDataTask?, error: NSError!) -> Void in
                failure(error)
            }
            
        )
    }
    func logout(){
        User.currentUser = nil
        deauthorize()
        //need to go back to the log in page
        NSNotificationCenter.defaultCenter().postNotificationName(User.userDidLogoutNotification, object: nil)
        
        
    }
    func currentAccount(success: (User) -> (), failure: (NSError)-> ()){
        GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: {
            (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            print("in current account in twitter client user: \(response)")
            let userDict = response as! NSDictionary
            let user = User(dictionary: userDict)
            success(user)
            }, failure: {
                (task: NSURLSessionDataTask?, error: NSError!) -> Void in
                failure(error)
            }
            
        )
        
        
    }
    
    func sendTweet(newTweet: String){
        POST("https://api.twitter.com/1.1/statuses/update.json?status=\(newTweet)", parameters: nil, progress: nil, success: {(operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            }) {(operation: NSURLSessionDataTask?, error: NSError) -> Void in
                
            }
    }
/*
    func sendreply(newreply: String){
        POST("https://api.twitter.com/1.1/statuses/update.json?status=\(newTweet)", parameters: nil, progress: nil, success: {(operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            }) {(operation: NSURLSessionDataTask?, error: NSError) -> Void in
                
        }
    }
*/
    
    func retweet(tweetID: String){
        POST("https://api.twitter.com/1.1/statuses/retweet/\(tweetID).json", parameters: nil, progress: nil, success: {(operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            }) {(operation: NSURLSessionDataTask?, error: NSError) -> Void in
                
            }
    }
    
    func favourite(tweetID: String){
        POST("https://api.twitter.com/1.1/favorites/create.json?id=\(tweetID)", parameters: nil, progress: nil, success: {(operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            }) {(operation: NSURLSessionDataTask?, error: NSError) -> Void in
                
        }
    }
    
    
    func loginWithCompletion(success: () -> (), failure: (NSError?)-> ()){
        deauthorize()
        //loginCompletion = completion
        loginSuccess = success
        loginFailure = failure
        //Fetch request token and redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: {(requestToken: BDBOAuth1Credential!) -> Void in
            let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(authURL)
            }) {(error: NSError!) -> Void in
                // there is an error
                self.loginFailure?(error)
               // self.loginCompletion?(user: nil, error: error)
                
        }

    }

}
