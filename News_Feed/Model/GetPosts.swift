//
//  GetPosts.swift
//  News_Feed
//
//  Created by clines329 on 11/18/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import AlamofireImage
import Kingfisher
import SDWebImage
import YouTubePlayer


class GetPosts {
    
    
    static func getPostImage(tableView : UITableView, indexpath:IndexPath, postFile : String, array : [[String:Any]], url : URL) -> UITableViewCell {
        let index = array[indexpath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        cell.videoView.isHidden = true
        
        
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        
        if let textStatus = index["postText"] as? String {
            cell.statusLabel.text! = textStatus.htmlToString
        }
        
        if let name = index["publisher"] as? [String:Any] {
            if let profilename = name["name"] as? String{
                cell.profileName.text! = profilename
            }
            
            if let avatarUrl =  name["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.profileImage.kf.setImage(with: url)
                
            }
        }
        
        cell.stausimage.sd_setImage(with: url, placeholderImage: nil, options: []) { (image, error, casheh, url) in
            if image != nil {
                DispatchQueue.main.async {
                    let ratio = image!.size.width / image!.size.height
                    let newHeight = cell.stausimage.frame.width / ratio
                    cell.heigthConstraint.constant = newHeight
                    
                    cell.stausimage.frame.size = CGSize(width: cell.contentView.frame.width, height:cell.heigthConstraint.constant)
                }
                
            }
                
            else {
                cell.heigthConstraint.constant = 0
            }
            
            cell.layoutIfNeeded()
            
            
            
        }
        
        return cell
        
    }
    
    static func getPostText (tableView : UITableView, indexpath:IndexPath, postFile : String, array : [[String:Any]]) -> UITableViewCell{
        
        let index = array[indexpath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        cell.videoView.isHidden = true
        cell.heigthConstraint.constant = 0
        
        
        
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        
        if let textStatus = index["postText"] as? String {
            cell.statusLabel.text! = textStatus.htmlToString
        }
        
        if let name = index["publisher"] as? [String:Any] {
            if let profilename = name["name"] as? String{
                cell.profileName.text! = profilename
            }
            
            if let avatarUrl =  name["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.profileImage.kf.setImage(with: url)
                
            }
        }
        
        
        cell.layoutIfNeeded()
        
        return cell
        
    }
    
    
    static func getMP3 (tableView : UITableView, indexpath:IndexPath, postFile : String, array : [[String:Any]]) -> UITableViewCell {
        let index = array[indexpath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicCell
        
        
        if let name = index["publisher"] as? [String:Any] {
            if let profilename = name["name"] as? String{
                cell.nameLabel.text! = profilename
            }
            if let avatarUrl =  name["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.avatarImage.kf.setImage(with: url)
                
            }
        }
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        
        if let textStatus = index["postText"] as? String {
            cell.statusLabel.text! = textStatus.htmlToString
            
        }
        
        cell.loadMp3(url: postFile)
        tableView.rowHeight = 200
        
        return cell
        
    }
    
    static func getPostLink(tableView : UITableView, indexpath:IndexPath, postLink : String, array : [[String:Any]]) -> UITableViewCell {
        let index = array[indexpath.row]
        tableView.rowHeight = UITableView.automaticDimension
                tableView.estimatedRowHeight = UITableView.automaticDimension
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostLinkCell") as! PostWithLinkCell
        
        if let name = index["publisher"] as? [String:Any] {
            if let profilename = name["name"] as? String{
                cell.profileName.text! = profilename
            }
            if let avatarUrl =  name["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.profileImage.kf.setImage(with: url)
                
            }
        }
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        
        if let textStatus = index["postText"] as? String {
            cell.postTitle.text! = textStatus.htmlToString
            
        }
        
        if let postLinkImage = index["postLinkImage"] as? String {
            let url = URL(string: postLinkImage)
            cell.linkImage.kf.setImage(with: url)
        }
        
        if let postLinkTitle = index["postLinkTitle"] as? String{
            cell.postLinkTitle.text! = postLinkTitle
        }
        
        if let postLinkContent = index["postLinkContent"] as? String {
            cell.postLinkContent.text! = postLinkContent
        }
        
        
        return cell
        
    }
    
    static func  getPostYoutub(tableView : UITableView, indexpath:IndexPath, postLink : String, array : [[String:Any]]) -> UITableViewCell{
      let index = array[indexpath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostYoutube") as! PostYoutubeCell
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        if let name = index["publisher"] as? [String:Any] {
            if let profilename = name["name"] as? String{
                cell.profileNAme.text! = profilename
            }
            if let avatarUrl =  name["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.profileImage.kf.setImage(with: url)
                
            }
        }
        
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        
        if let textStatus = index["postText"] as? String {
            cell.statusLabel.text! = textStatus.htmlToString
            
        }
        
        if let youtubeLink = index["postYoutube"] as? String{
            
            cell.videoView.playerVars   = ["playsinline" : 1 as AnyObject]
            cell.videoView.loadVideoID(youtubeLink)
             
            cell.videoView.play()
        }
        
        
        return cell
    }
    
    
    
}
