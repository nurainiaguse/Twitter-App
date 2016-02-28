//
//  TestingViewController.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/25/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class TestingViewController: UIViewController {
    
    var tweety: Tweet!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweethandleLabel: UILabel!

    @IBOutlet weak var tweetctlabel: UILabel!
    
    @IBOutlet weak var dpView: UIImageView!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var favctLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = tweety.userName
        tweetTextLabel.text = tweety.text as? String
        dpView.setImageWithURL(tweety.profileImageURL!)
        tweetctlabel.text = "\(tweety.retweetCount)"
        favctLabel.text = "\(tweety.favCount)"
        //timestampLabel.text = tweet.createdAtString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backtodetails(segue:UIStoryboardSegue){
        
        
    }
    
    @IBAction func cancelreply(segue:UIStoryboardSegue){
        
        
    }
    
    @IBAction func sendreply(segue:UIStoryboardSegue){
    /*    if let replyViewController = segue.sourceViewController as? ReplyTweetViewController{
            
            if let reply = replyViewController.replyField.text{ // fire the api request to update status
                TwitterClient.sharedInstance.sendreply(reply)
            }
        }
*/
    }
    
    @IBAction func onretweet(sender: AnyObject) {
        print("retweet clicked")
        self.tweety.retweetCount++
        tweetctlabel.text = "\(tweety.retweetCount)"
        TwitterClient.sharedInstance.retweet(tweety.tweetID as! String)
    }

    @IBAction func onfavourite(sender: AnyObject) {
        self.tweety.favCount++
        favctLabel.text = "\(tweety.favCount)"
        TwitterClient.sharedInstance.favourite(tweety.tweetID as! String)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toUserProfile"{
            let nav = segue.destinationViewController as! UINavigationController
            
            let profileViewController = nav.topViewController as! ProfileViewController
            
            profileViewController.user = tweety.user
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
