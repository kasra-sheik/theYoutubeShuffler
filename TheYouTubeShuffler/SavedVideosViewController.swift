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
    var videos:[Video]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if(userDefaults.objectForKey("savedVideos") != nil) {
            let decoded  = userDefaults.objectForKey("savedVideos") as! NSData
            let videoArray = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! [Video]
            self.videos = videoArray
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if(userDefaults.objectForKey("savedVideos") != nil) {
            return videos!.count
        }
        else {
            return 0
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = savedVideos.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SavedVideosCollectionViewCell

        let width = 311.5
        let height = 153
        let id = self.videos![indexPath.row].videoId
        cell.video.allowsInlineMediaPlayback = false

        
        let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(height) + "\" width=\"" + String(width) + "\" src=\"http://www.youtube.com/embed/" + id + "?showinfo=0&modestbranding=1&frameborder=0&&playsinline=1&rel=0\"></iframe></body></html>"
        
        cell.video.loadHTMLString(videoEmbedString, baseURL: nil)
        
        cell.videoTitle.text = videos![indexPath.row].videoTitle
        cell.category.text = "Category: " + videos![indexPath.row].videoCateogry
        
        
        
        return cell
    }
  
}
