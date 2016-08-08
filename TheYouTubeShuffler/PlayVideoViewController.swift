
//
//  PlayVideoViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 7/15/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import Alamofire

class PlayVideoViewController: UIViewController {
    
    var selectedCategory: String = ""
    var youtubeId: String = ""
    var videoTitle: String = ""
    var videoDescription: String = ""

    @IBOutlet weak var shuffle: UIButton!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoPlayer: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videoPlayer.backgroundColor = UIColor.grayColor()
        self.shuffle.backgroundColor = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)
        titleLabel.hidden = true
        descriptionLabel.hidden = true
        shuffle.titleLabel?.font = UIFont(name:"Avenir", size:22)
        
//        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width)
        

        self.title = selectedCategory
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func generate(sender: AnyObject) {
        print("Shuffling..")
        
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
    func loadVideo(id: String) {

        let width = self.view.frame.size.width
        let height = (width/320 * 180)
        self.heightLayoutConstraint.constant = height + 64
        
        
        
        self.videoPlayer.allowsInlineMediaPlayback = true
        
        let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(height) + "\" width=\"" + String(width) + "\" src=\"http://www.youtube.com/embed/" + id + "?showinfo=0&modestbranding=1&frameborder=0&&playsinline=1&rel=0\"></iframe></body></html>"
        self.videoPlayer.loadHTMLString(videoEmbedString, baseURL: nil)
        
        //load title and description
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=" + id + "&key=AIzaSyDd7fUh3e5ylq-0Wv92mkyxaXbm07lm1Fc").responseJSON { response in
            
            if let JSON = response.result.value {
                if(JSON["items"]!!.count > 0) {
                    self.videoTitle = JSON["items"]!![0]["snippet"]!!["title"] as! String
                    self.videoDescription = JSON["items"]!![0]["snippet"]!!["description"] as! String
                }
                
            }
 
                
                self.titleLabel.text = self.videoTitle
                self.titleLabel.hidden = false
                self.descriptionLabel.text = self.videoDescription
                self.descriptionLabel.hidden = false
            
        }
        

        
        
    }


}