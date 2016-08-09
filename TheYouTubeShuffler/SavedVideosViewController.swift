//
//  SavedVideosViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 8/9/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import Alamofire

class SavedVideosViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var savedVideos: UICollectionView!
    
    var videoIds:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let defaults = NSUserDefaults.standardUserDefaults()
        let videoArray = defaults.objectForKey("savedVideosArray") as? [String] ?? [String]()
        self.videoIds = videoArray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoIds.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = savedVideos.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SavedVideosCollectionViewCell
    
        let width = 359
        let height = 153
        let id = self.videoIds[indexPath.row]
        cell.video.allowsInlineMediaPlayback = false

        
        let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(height) + "\" width=\"" + String(width) + "\" src=\"http://www.youtube.com/embed/" + id + "?showinfo=0&modestbranding=1&frameborder=0&&playsinline=1&rel=0\"></iframe></body></html>"
        
        cell.video.loadHTMLString(videoEmbedString, baseURL: nil)
        
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=" + id + "&key=AIzaSyDd7fUh3e5ylq-0Wv92mkyxaXbm07lm1Fc").responseJSON { response in
            
            if let JSON = response.result.value {
                if(JSON["items"]!!.count > 0) {
                    cell.videoTitle.text = JSON["items"]!![0]["snippet"]!!["title"] as! String
                }
                
            }
            
            
        }
        
        
        
        
        
        return cell
    }
  
}
