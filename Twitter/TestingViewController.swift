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
