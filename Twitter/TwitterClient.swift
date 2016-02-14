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
    
    class var sharedInstance: TwitterClient{
        struct Static{
            static let instance =
            TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret)
            
        }
        return Static.instance
    }

}
