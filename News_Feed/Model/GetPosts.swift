//
//  GetPosts.swift
//  News_Feed
//
//  Created by clines329 on 11/18/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit


class GetPosts {
    
    
  func getPostImage(tableView : UITableView, index:Int, postFile : String) -> UITableViewCell{
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
   tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = UITableView.automaticDimension
    cell.videoView.isHidden = true
    if let time = index["postTime"] as? String{
        cell.timeLabel.text! = time
    }
        
        
     return cell
    }
    
    
    
    
    
}
