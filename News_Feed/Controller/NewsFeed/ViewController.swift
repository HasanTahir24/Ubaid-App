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
    
//    var array = [datas]()
    var newsFeedArray = [[String:Any]]()
    var filterFeedArray = [[String:Any]]()
    var limit = 25
    let spinner = UIActivityIndicatorView(style: .gray)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
         ZKProgressHUD.show("Loading")
        
        
        
        
        tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        tableView.register(UINib(nibName: "MusicCell", bundle: nil),
            forCellReuseIdentifier: "musicCell")
        tableView.register(UINib(nibName: "PostWithLinkCell", bundle: nil), forCellReuseIdentifier: "PostLinkCell")
        
        tableView.register(UINib(nibName: "PostYoutubeCell", bundle: nil), forCellReuseIdentifier: "PostYoutube")

        self.getNewsFeed(access_token: "\("?")\("access_token")\("=")\(UserData.getAccess_Token()!)", limit: self.limit)
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
            let index = self.newsFeedArray[indexPath.row]
            //
            var tableViewCells = UITableViewCell()
            let postfile = index["postFile"] as? String ?? ""
            let postLink = index["postLink"] as? String ?? ""
            let postYoutube = index["postYoutube"] as?String ?? ""
            
            
            if postfile != ""  {
                let url = URL(string: postfile)
                let urlExtension: String? = url?.pathExtension
                if (urlExtension == "jpg" || urlExtension == "png" || urlExtension == "jpeg"){
                    
                    
                    tableViewCells = GetPosts.getPostImage(tableView: tableView, indexpath: indexPath, postFile:  postfile , array: self.newsFeedArray, url: url!)
                }
                    
                else if( urlExtension == ".wav" ||  urlExtension == ".mp3"){
                    tableViewCells = GetPosts.getMP3(tableView: tableView, indexpath: indexPath, postFile: postfile, array: self.newsFeedArray)
                    
                }

            }
                
            else if postLink != "" {
                tableViewCells = GetPosts.getPostLink(tableView: tableView, indexpath: indexPath, postLink: postLink, array: self.newsFeedArray)
                
            }
            
            else if postYoutube != "" {
                
                tableViewCells = GetPosts.getPostYoutub(tableView: tableView, indexpath: indexPath, postLink: postYoutube, array: self.newsFeedArray)
            }
            
            else {
                tableViewCells = GetPosts.getPostText(tableView: tableView, indexpath: indexPath, postFile: postfile, array: self.newsFeedArray)
            }
            
            //
            return tableViewCells
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
          let count = self.newsFeedArray.count
          let lastElement = count - 2
        
        if indexPath.row == lastElement {
            self.limit = self.limit + 10
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            self.tableView.tableFooterView = spinner

            self.tableView.tableFooterView?.isHidden = false
            self.getNewsFeed(access_token: "\("?")\("access_token")\("=")\(UserData.getAccess_Token()!)", limit: self.limit)

            
        }
    
    }
    
    
    
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return UITableView.automaticDimension
        }
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
    
    
    private func getNewsFeed (access_token : String, limit : Int) {
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            
            showAlert(title: "", message: "Internet Connection Failed")
            
        case .online(.wwan), .online(.wiFi):
            GetNewsFeedManagers.sharedInstance.get_News_Feed(access_token: access_token, limit: limit) {[weak self] (success, authError, error) in
                if success != nil {
                    for i in success!.data{
                        self?.filterFeedArray.append(i)
//                        self?.newsFeedArray.append(i)
                        
                    }
                    
                    let arraySlice = self?.filterFeedArray.suffix(10)
                    let newArray = Array(arraySlice!)
                    for j in newArray {
                        self?.newsFeedArray.append(j)
                    }
                    
                    self?.spinner.stopAnimating()
//                    self?.tableView.tableFooterView?.isHidden = true
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
