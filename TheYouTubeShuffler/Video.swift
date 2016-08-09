//
//  Video.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 8/9/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import Foundation


class Video: NSObject, NSCoding {
    
    var videoId:String = ""
    var videoTitle:String = ""
    var videoCateogry:String = ""
    
    init(videoId: String, videoTitle: String, videoCateogry:String) {
        self.videoId = videoId
        self.videoTitle = videoTitle
        self.videoCateogry = videoCateogry
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let videoId = aDecoder.decodeObjectForKey("videoId") as! String
        let videoTitle = aDecoder.decodeObjectForKey("videoTitle") as! String
        let videoCategory = aDecoder.decodeObjectForKey("videoCategory") as! String
        self.init(videoId: videoId, videoTitle: videoTitle, videoCateogry: videoCategory)
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(videoId, forKey: "videoId")
        aCoder.encodeObject(videoTitle, forKey: "videoTitle")
        aCoder.encodeObject(videoCateogry, forKey: "videoCategory")

    }
    
}