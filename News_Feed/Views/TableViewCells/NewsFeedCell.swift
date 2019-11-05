//
//  NewsFeedCell.swift
//  News_Feed
//
//  Created by clines329 on 10/19/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import SDWebImage
class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    
    
    @IBOutlet weak var profileImage: Roundimage!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var heigthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stausimage: UIImageView!
    
    @IBOutlet weak var videoView: UIView!
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                stausimage.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                stausimage.addConstraint(aspectConstraint!)
            }
        }
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        aspectConstraint = nil
//    }

    func setPostedImage(image : UIImage) {

        let aspect = image.size.width / image.size.height

        aspectConstraint = NSLayoutConstraint(item: stausimage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stausimage, attribute: NSLayoutConstraint.Attribute.height, multiplier: aspect, constant: 0.0)

        stausimage.image = image
    }
    
     override func prepareForReuse() {
        self.stausimage.sd_cancelCurrentImageLoad()
        self.stausimage.image = nil
           }
    
    
}
