//
//  ViewController.swift
//  News_Feed
//
//  Created by clines329 on 10/19/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import AlamofireImage
import Kingfisher
import SDWebImage

import ZKProgressHUD

struct datas{
    let status : String
    let image : UIImage?
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = [datas]()
    
    
    var newsFeedArray = [Get_News_FeedModel.Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
NotificationCenter.default.addObserver(self, selector: #selector(ViewController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
              Reach().monitorReachabilityChanges()
        ZKProgressHUD.show("Loading")
        
      
        
        
        tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        tableView.register(UINib(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: "musicCell")
    self.getNewsFeed(access_token: "?access_token=f86e0a1580afed8fba872189158964c62cd358812f0033500b23126db4ea2be3bf7c42e54305342331f81674a348511b990af268ca3a8391")
    }
    
    
    /////////////////////////NetWork Connection//////////////////////////
       @objc func networkStatusChanged(_ notification: Notification) {
           if let userInfo = notification.userInfo {
               let status = userInfo["Status"] as! String
               print(status)
               
           }
           
       }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return self.newsFeedArray.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if indexPath.section == 0{
    let cell = tableView.dequeueReusableCell(withIdentifier: "StroiesCell") as! StoriesCell
            self.tableView.rowHeight = 100
            return cell
       
        }
           else  {
//
            var cellIdentefier = ""
            var tableViewCells = UITableViewCell()
//    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentefier) as? UITableViewCell
            if self.newsFeedArray[indexPath.row].postFile != "" {
            let url = URL(string: self.newsFeedArray[indexPath.row].postFile)
            
            let urlExtension: String? = url?.pathExtension
            print("urlExtension",urlExtension)
            if (urlExtension == "jpg" || urlExtension == "png" || urlExtension == "jpeg"){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
                
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.estimatedRowHeight = UITableView.automaticDimension
                let url1 = URL(string: self.newsFeedArray[indexPath.row].publisher.avatar)
                cell.profileImage.kf.setImage(with: url1)
                cell.profileName.text = self.newsFeedArray[indexPath.row].publisher.name
                cell.timeLabel.text = self.newsFeedArray[indexPath.row].postTime
                cell.statusLabel.text! = self.newsFeedArray[indexPath.row].postText.htmlToString
                cell.videoView.isHidden = true
               
        cell.stausimage.sd_setImage(with: url, placeholderImage: nil, options: []) {[weak self] (image, error, casheh, url) in
                      if image != nil {
                DispatchQueue.main.async {
                let ratio = image!.size.width / image!.size.height
                let newHeight = cell.stausimage.frame.width / ratio
                cell.heigthConstraint.constant = newHeight
                    
                cell.stausimage.frame.size = CGSize(width: cell.contentView.frame.width, height:  cell.heigthConstraint.constant)
                
                  
              }
                        

                      }
                        
                       

 else {
            cell.heigthConstraint.constant = 0
                      }

           }
                
                cellIdentefier = "NewsFeedCell"
                tableViewCells = cell
            
            }
        else if( urlExtension == ".wav" ||  urlExtension == ".mp3"){
    let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicCell
                
    cell.loadMp3(url: self.newsFeedArray[indexPath.row].postFile)
     let url1 = URL(string:
        self.newsFeedArray[indexPath.row].publisher.avatar)
    cell.avatarImage.kf.setImage(with: url1)
                
   cell.nameLabel.text = self.newsFeedArray[indexPath.row].publisher.name
                
    cell.timeLabel.text = self.newsFeedArray[indexPath.row].postTime
    cell.statusLabel.text! = self.newsFeedArray[indexPath.row].postText.htmlToString
    self.tableView.rowHeight = 200
                
   cellIdentefier = "musicCell"
   tableViewCells = cell



            }
    else if urlExtension == "mp4" {
      let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
            
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = UITableView.automaticDimension
            let url1 = URL(string: self.newsFeedArray[indexPath.row].publisher.avatar)
            cell.profileImage.kf.setImage(with: url1)
            cell.profileName.text = self.newsFeedArray[indexPath.row].publisher.name
            cell.timeLabel.text = self.newsFeedArray[indexPath.row].postTime
            cell.statusLabel.text! = self.newsFeedArray[indexPath.row].postText.htmlToString
            cell.heigthConstraint.constant = 0
            cell.videoView.isHidden = false
            }
         
        }
            else  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
                cell.profileName.text = self.newsFeedArray[indexPath.row].publisher.name
                cell.timeLabel.text = self.newsFeedArray[indexPath.row].postTime
                cell.statusLabel.text! = self.newsFeedArray[indexPath.row].postText.htmlToString
                let url1 = URL(string:
               self.newsFeedArray[indexPath.row].publisher.avatar)
                cell.profileImage.kf.setImage(with: url1)
                cell.heigthConstraint.constant = 0
//                 cell.videoView.isHidden = true
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.estimatedRowHeight = UITableView.automaticDimension
                cellIdentefier = "NewsFeedCell"
                tableViewCells = cell
            }

//            ZKProgressHUD.dismiss()

            return tableViewCells
                 
        }
        
     
       }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section  == 0 {
//            return 100
//        }
//        else{
//            return 414
////           return UITableView.automaticDimension
////            self.tableView.estimatedRowHeight = UITableView.automaticDimension
//
//
//
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section  == 0 {
//            return 100
//        }
//        else{
////           self.tableView.rowHeight = UITableView.automaticDimension
//
////            UITableView.automaticDimension
//
//
//
//            }
//    }
    

    private func getNewsFeed (access_token : String) {
    
    let status = Reach().connectionStatus()
           switch status {
           case .unknown, .offline:
       
            showAlert(title: "", message: "Internet Connection Failed")
               
           case .online(.wwan), .online(.wiFi):
            GetNewsFeedManagers.sharedInstance.get_News_Feed(access_token: access_token) {[weak self] (success, authError, error) in
                if success != nil {
                    for i in success!.data{
                        self?.newsFeedArray.append(i)
                        
                    }
//                    self?.tableView.beginUpdates()
//                    self?.tableView.insertRows(at: [IndexPath(row: (self?.newsFeedArray.count)!-1, section: 0)], with: .automatic)
//                    self?.tableView.endUpdates()
                    
                    
                    self?.tableView.reloadData()
                    ZKProgressHUD.dismiss()
                    print(self?.newsFeedArray.count)
                    
                }
                else if authError != nil {
                    ZKProgressHUD.dismiss()
                    self?.showAlert(title: "", message: (authError?.errors.errorText)!)

                }
                
                
                
                else if error  != nil {
                    ZKProgressHUD.dismiss()
                    self?.showAlert(title: "", message: "InternalError")
                }
            }
           
    
    
    
    
    }
    
    
    
    
}

  }

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
