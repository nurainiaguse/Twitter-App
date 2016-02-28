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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "toTweetDetails"{
            let nav = segue.destinationViewController as! UINavigationController
            
            let profileViewController = nav.topViewController as! ProfileViewController
            
            profileViewController.user = tweety.user
       // }
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
