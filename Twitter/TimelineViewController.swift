//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/23/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    var tweets: [Tweet]!
    
    @IBAction func onLogout(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            for tweet in tweets{
                print(tweet.text)
                
            }
            }, failure: { (error: NSError) -> () in
                
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
