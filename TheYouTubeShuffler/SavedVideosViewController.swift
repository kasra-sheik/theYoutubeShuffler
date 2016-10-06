//
//  SavedVideosViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 8/9/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import Alamofire

class SavedVideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var videos:[Video]?
    var selectedVideoId:String = ""
    @IBOutlet weak var noSavedLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        noSavedLabel.isHidden = true
        
        
        self.automaticallyAdjustsScrollViewInsets = false

        let userDefaults = UserDefaults.standard
        if(userDefaults.object(forKey: "savedVideos") != nil) {
            let decoded  = userDefaults.object(forKey: "savedVideos") as! Data
            let videoArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Video]
            self.videos = videoArray
            if(videos?.count == nil) {
                noSavedLabel.isHidden = false
                tableView.isHidden = true
            }
        }
    }
        // Do any additional setup after loading the view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(videos != nil) {
            return (self.videos?.count)!
        }
        noSavedLabel.isHidden = false
        self.tableView.isHidden = true
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedVideoCell")
      
        cell?.textLabel?.text = self.videos![(indexPath as NSIndexPath).row].videoTitle
        cell?.textLabel?.font = UIFont(name: "Avenir", size: 12)
        cell?.textLabel?.numberOfLines = 2
        cell?.detailTextLabel?.text = "\tCategory: " + self.videos![(indexPath as NSIndexPath).row].videoCateogry

        let videoThumbnailString = "https://i1.ytimg.com/vi/" + self.videos![(indexPath as NSIndexPath).row].videoId + "/mqdefault.jpg"
        
        let url = URL(string: videoThumbnailString)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell?.imageView!.image = UIImage(data: data!)
    
        return cell!
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            videos?.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.reloadData()
            let userDefaults = UserDefaults.standard
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: videos!)
            userDefaults.set(encodedData, forKey: "savedVideos")
            userDefaults.synchronize()

            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedVideoId = self.videos![(indexPath as NSIndexPath).row].videoId

        self.performSegue(withIdentifier: "showSavedVideo", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playSavedVideo = segue.destination as! PlaySavedVideoViewController
        
        playSavedVideo.videoId = self.selectedVideoId
        
    }
}

