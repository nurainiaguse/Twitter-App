//
//  HomepageViewController.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/27/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {
    
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var mydpImage: UIImageView!
    
   // var me: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        var me1: User!
        print("in acct view")
        
        TwitterClient.sharedInstance.currentAccount({ (me: User) -> () in
            me1 = me
            print("success found user")
            }, failure: { (error: NSError) -> () in
                print("no find user")
        })
        print("b4 set image")
        
        tweetLabel.text = me1.name as? String
        //mydpImage.setImageWithURL(me.profileImageUrl!)

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
