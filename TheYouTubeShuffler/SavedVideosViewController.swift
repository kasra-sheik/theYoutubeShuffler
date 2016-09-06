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
        noSavedLabel.hidden = true
        
        
        self.automaticallyAdjustsScrollViewInsets = false

        let userDefaults = NSUserDefaults.standardUserDefaults()
        if(userDefaults.objectForKey("savedVideos") != nil) {
            let decoded  = userDefaults.objectForKey("savedVideos") as! NSData
            let videoArray = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! [Video]
            self.videos = videoArray
            if(videos?.count == nil) {
                noSavedLabel.hidden = false
                tableView.hidden = true
            }
            else {
                print("No Saved Videos..")
            }
                
            }
        }
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(videos != nil) {
            return (self.videos?.count)!
        }
        noSavedLabel.hidden = false
        self.tableView.hidden = true
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedVideoCell")
      
        cell?.textLabel?.text = self.videos![indexPath.row].videoTitle
        cell?.textLabel?.font = UIFont(name: "Avenir", size: 12)
        cell?.textLabel?.numberOfLines = 2
        cell?.detailTextLabel?.text = "\tCategory: " + self.videos![indexPath.row].videoCateogry

        let videoThumbnailString = "https://i1.ytimg.com/vi/" + self.videos![indexPath.row].videoId + "/mqdefault.jpg"
        
        let url = NSURL(string: videoThumbnailString)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell?.imageView!.image = UIImage(data: data!)
    
        return cell!
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            videos?.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(videos!)
            userDefaults.setObject(encodedData, forKey: "savedVideos")
            userDefaults.synchronize()

            
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedVideoId = self.videos![indexPath.row].videoId

        self.performSegueWithIdentifier("showSavedVideo", sender: self)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let playSavedVideo = segue.destinationViewController as! PlaySavedVideoViewController
        
        playSavedVideo.videoId = self.selectedVideoId
        
    }
}

