//
//  MusicCell.swift
//  News_Feed
//
//  Created by clines329 on 11/3/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import AVFoundation

protocol PlaySound{
func playMp3() -> ()
}


class MusicCell: UITableViewCell {
    
    var delegate : PlaySound?
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var plarBtn: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var avatarImage: Roundimage!
    
    
    
    var isPlay = 0
      var players : AVPlayer!
    //    let cuurentItem : AVPlayerItem
        let audioSession = AVAudioSession.sharedInstance()
    
    
    @IBAction func Play(_ sender: Any) {
//        self.delegate?.playMp3(){
//            return  self.BtnPlay()
//        }
        self.BtnPlay()
    }
    
    func BtnPlay(){
        if self.isPlay == 0 {
                self.players.play()
                 self.plarBtn.setImage(UIImage(named: "pause-button"), for: .normal)
                self.isPlay = 1
             }
             else {
            self.players.pause()
        self.plarBtn.setImage(UIImage(named: "play-button"), for: .normal)
         self.isPlay = 0
             }
    }
    
    func loadMp3 (url : String){
   let url  = URL.init(string:url)
//        "https://demo.wowonder.com/upload/sounds/2019/11/AT2wCvBOZr9Mk7hLdM6p_02_76a1633cc3719e55d4d0cc642c4b8210_soundFile.mp3"
         
         let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
         players = AVPlayer(playerItem: playerItem)
         
         let playerLayer = AVPlayerLayer(player: players!)
         
         playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        self.contentView.layer.addSublayer(playerLayer)
         let audioAsset = AVURLAsset.init(url: url!, options: nil)
         let duration = audioAsset.duration
         let durationInSeconds = CMTimeGetSeconds(duration)
         print(durationInSeconds)
         slider.maximumValue = Float(durationInSeconds)
        slider.minimumValue = 0.0
         let convertToMinute = durationInSeconds / 60
         print(convertToMinute)
         
         do {
             try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
             try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
         } catch {
             print("error.")
         }

        
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                let url  = URL.init(string:"https://demo.wowonder.com/upload/sounds/2019/11/AT2wCvBOZr9Mk7hLdM6p_02_76a1633cc3719e55d4d0cc642c4b8210_soundFile.mp3")
         
         let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
         players = AVPlayer(playerItem: playerItem)
         
         let playerLayer = AVPlayerLayer(player: players!)
         
         playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
         self.contentView.layer.addSublayer(playerLayer)
         let audioAsset = AVURLAsset.init(url: url!, options: nil)
         let duration = audioAsset.duration
         let durationInSeconds = CMTimeGetSeconds(duration)
         print(durationInSeconds)
         slider.maximumValue = Float(durationInSeconds)
        slider.minimumValue = 0.0
         let convertToMinute = durationInSeconds / 60
         print(convertToMinute)
         
         do {
             try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
             try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
         } catch {
             print("error.")
         }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
