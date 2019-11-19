//
//  PostYoutubeCell.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import YouTubePlayer

class PostYoutubeCell: UITableViewCell {
    
    @IBOutlet weak var profileNAme: UILabel!
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var videoView: YouTubePlayerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
