
//
//  PlayVideoViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 7/15/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class PlayVideoViewController: UIViewController {
    
    var selectedCategory: String = ""
    var youtubeId: String = ""
    var videoTitle: String = ""
    var videoDescription: String = ""
    
    @IBOutlet weak var greetingLabel: UILabel!

    @IBOutlet weak var shuffle: UIButton!
    @IBOutlet weak var save: UIButton!

    @IBOutlet weak var videoText: UITextView!
    
      @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoPlayer: UIWebView!
    //to help with load on start up issues
    var firstLoad:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedCategory
        self.videoPlayer.backgroundColor = UIColor.gray
        self.shuffle.backgroundColor = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)
//        titleLabel.hidden = true
//        descriptionLabel.hidden = true
//        descriptionTextBox.hidden = true
        videoText.isHidden = true
        shuffle.titleLabel?.font = UIFont(name:"Avenir", size:22)
        save.titleLabel?.font = UIFont(name:"Avenir", size:22)
        self.videoText.isEditable = false
        self.save.isEnabled = false
//        self.generate(shuffle)
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func generate(_ sender: AnyObject) {
        print("Shuffling..")
        self.greetingLabel.isHidden = true
        if(self.firstLoad == true) {
            HUD.flash(.labeledProgress(title: "Loading", subtitle: ""))
            
        }

        
        //grab info from server
        if(selectedCategory == "Funny") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/funny").responseJSON { response in
                
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)

                }
            }
        }
        else if(selectedCategory == "Sports") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/sports").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
                
            }
            
        }
        else if(selectedCategory == "Science and Technology") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/science").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
                
            }
            
        }
        else if(selectedCategory == "Music") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/music").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
            }
        }
        else if(selectedCategory == "Animals") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/animals").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
            }
        }
        else if(selectedCategory == "Popular") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/popular").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
            }
        }
        else if(selectedCategory == "Random") {
            Alamofire.request(.GET, "https://id-generator.herokuapp.com/random").responseJSON { response in
                if let JSON = response.result.value {
                    self.youtubeId = JSON["id"] as! String
                    self.loadVideo(self.youtubeId)
                    
                }
            }
        }
    }
    func loadVideo(_ id: String) {
     
        let width = self.view.frame.size.width
        let height = (width/320 * 180)
        self.heightLayoutConstraint.constant = height + 64
        self.videoPlayer.allowsInlineMediaPlayback = true
        
        let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(describing: height) + "\" width=\"" + String(describing: width) + "\" src=\"http://www.youtube.com/embed/" + id + "?showinfo=0&modestbranding=1&frameborder=0&&playsinline=1&rel=0\"></iframe></body></html>"
        self.videoPlayer.loadHTMLString(videoEmbedString, baseURL: nil)
        
        //load title and description
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=" + id + "&key=AIzaSyDd7fUh3e5ylq-0Wv92mkyxaXbm07lm1Fc").responseJSON { response in
            
            if let JSON = response.result.value {
                if(JSON["items"]!!.count > 0) {
                    self.videoTitle = JSON["items"]!![0]["snippet"]!!["title"] as! String
                    self.videoDescription = JSON["items"]!![0]["snippet"]!!["description"] as! String
                }
                
            }
            let videoInfoText:String = self.videoTitle + "\n\n" + self.videoDescription
            let infoTextSize = videoInfoText.characters.count
            let attributedText: NSMutableAttributedString = NSMutableAttributedString(string: videoInfoText)
            attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 0, length: self.videoTitle.characters.count))
            
            self.videoText.attributedText = attributedText
            self.videoText.isHidden = false
            self.save.isEnabled = true
            HUD.hide()
            self.firstLoad = false
        }
    }
    @IBAction func saveVideo(_ sender: AnyObject) {
        if(self.videoTitle == "" && self.videoDescription == "") {
            print("cannot save video yet..")
            return
        }
        print("Saving..")
        let defaults = UserDefaults.standard
        
        if(defaults.object(forKey: "savedVideos") == nil) {
            var test:[Video] = []
            
           let video = Video(videoId: self.youtubeId, videoTitle: self.videoTitle, videoCateogry: self.selectedCategory)
            HUD.flash(.labeledSuccess(title: "", subtitle: "Saved!"), delay: 1.0)

            
            test.append(video)
            let userDefaults = UserDefaults.standard
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: test)
            userDefaults.set(encodedData, forKey: "savedVideos")
            userDefaults.synchronize()
        
        }
        else {
            var videoArray:[Video] = []
            let decoded  = defaults.object(forKey: "savedVideos") as! Data
            let currentlySavedVideos = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Video]
            videoArray = currentlySavedVideos
            
         let video = Video(videoId: self.youtubeId, videoTitle: self.videoTitle, videoCateogry: self.selectedCategory)
           
            if(videoAlreadySaved(videoArray, vid: video)) {
                return
            }
            
            videoArray.append(video)
            
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: videoArray)
            defaults.set(encodedData, forKey: "savedVideos")
            defaults.synchronize()
            HUD.flash(.labeledSuccess(title: "", subtitle: "Saved!"), delay: 1.0)

            
            
            //check for duplicate values
        }

       
        
        
    
    }
    func videoAlreadySaved(_ videoArray:[Video], vid:Video) ->Bool {
        let currentVidId = vid.videoId
        for video in videoArray {
            if(currentVidId == video.videoId) {
                return true
            }
        }
        
        return false
    }
}
