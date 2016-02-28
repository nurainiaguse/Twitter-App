//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/27/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: NSDictionary!
    var profileImageURL: NSURL?

    @IBOutlet weak var userdpImage: UIImageView!
    
    @IBOutlet weak var tweetct: UILabel!
    
    @IBOutlet weak var followersct: UILabel!
    
    @IBOutlet weak var followingct: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let profileUrlString = user["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profileImageURL = NSURL(string: profileUrlString)
        }
        else {
            profileImageURL = nil
        }
        userdpImage.setImageWithURL(profileImageURL!)
        
        tweetct.text = "\(user["statuses_count"]!)"
        followingct.text = "\(user["friends_count"]!)"
        followersct.text = "\(user["followers_count"]!)"

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
