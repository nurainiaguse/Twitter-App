//
//  TweetCell.swift
//  Twitter
//
//  Created by Nuraini Aguse on 2/23/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var tweetlabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var retweetLabel: UILabel!
    
    @IBOutlet weak var favLabel: UILabel!
    
    var retweeted : BooleanType = false
    var favourited : BooleanType = false
    var retweetct : Int!
    var favouritect : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressRT(sender: AnyObject) {
        if (retweeted){
            retweeted = false
            retweetct = retweetct - 1
           retweetLabel.text = "\(retweetct)"
        }
        else{
            retweeted = true
            retweetct = retweetct + 1
            retweetLabel.text = "\(retweetct)"
        }
        
    }
    
    @IBAction func pressFav(sender: AnyObject) {
        if (favourited){
            favourited = false
            favouritect = favouritect - 1
            favLabel.text = "\(favouritect)"
        }
        else{
            favourited = true
            favouritect = favouritect + 1
            favLabel.text = "\(favouritect)"
        }
    }

}
