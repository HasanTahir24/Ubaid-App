//
//  PostWithLinkCell.swift
//  News_Feed
//
//  Created by clines329 on 11/5/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit

class PostWithLinkCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var profileImage: Roundimage!
    
    @IBOutlet weak var postTitle: UILabel!
    
    
    @IBOutlet weak var linkImage: UIImageView!
    
    @IBOutlet weak var postLinkTitle: UILabel!
    
    @IBOutlet weak var postLinkContent: UILabel!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
