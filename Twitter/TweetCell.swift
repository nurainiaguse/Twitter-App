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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
