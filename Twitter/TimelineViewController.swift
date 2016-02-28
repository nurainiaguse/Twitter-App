//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/23/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tweets = [Tweet]()
    
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    @IBAction func onLogout(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            print("in view did load")
            print(tweets.count)
            print(self.tweets.count)
            self.timelineTableView.reloadData()
            }, failure: { (error: NSError) -> () in
                
        })
        timelineTableView.dataSource = self
        timelineTableView.delegate = self
        print("before reaload data")
        //timelineTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("the tweet count is")
        print(tweets.count)
        return tweets.count
       /* if let tweets = tweets { //if movies is not nil, assign it to movies
            print("the tweet count is")
            print(tweets.count)
            return tweets.count
            
        }
        else {
            print("count is 0")
            return 0
        }
*/
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let tweet = tweets[indexPath.row]
    let cell = timelineTableView.dequeueReusableCellWithIdentifier("tweetcell", forIndexPath: indexPath) as! TweetCell
        print("printing out the cells")
        print(tweet.text)
    cell.username.text = tweet.userName
        cell.tweetlabel.text = tweet.text as? String
        cell.favouritect = tweet.favCount
        cell.retweetct = tweet.retweetCount
        cell.profileImageView.setImageWithURL(tweet.profileImageURL!)
        cell.retweetLabel.text = "\(cell.retweetct)"
        cell.favLabel.text = "\(cell.favouritect)"
        cell.timestampLabel.text = tweet.createdAtString

        
        return cell
    
    }
    
    @IBAction func canceltweet(segue:UIStoryboardSegue){
        
        
    }
    
    @IBAction func sendtweet(segue:UIStoryboardSegue){
        if let composeViewController = segue.sourceViewController as? ComposeViewController{
            
            if let newtweet = composeViewController.tweetField.text{ // fire the api request to update status
                TwitterClient.sharedInstance.sendTweet(newtweet)
            }
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTweetDetails"{
        let cell = sender as! UITableViewCell
        let indexPath = timelineTableView.indexPathForCell(cell)
        let tweet = tweets[indexPath!.row]
        
        let TweetDetailViewController = segue.destinationViewController as! TestingViewController
    
        TweetDetailViewController.tweety = tweet
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
