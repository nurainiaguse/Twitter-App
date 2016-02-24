//
//  Tweet.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/15/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: NSString?
    var createdAtString: String?
    var createdAt: NSDate?
    var retweetCount: Int = 0
    var favCount: Int = 0
    init(dictionary: NSDictionary){
        //user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        if let createdAtString = createdAtString{
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            createdAt = formatter.dateFromString(createdAtString)
        }
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in array{
            tweets.append(Tweet(dictionary: dictionary))
            
        }
        return tweets
    }
}
