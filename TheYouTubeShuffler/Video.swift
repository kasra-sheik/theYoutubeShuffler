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
        let videoId = aDecoder.decodeObject(forKey: "videoId") as! String
        let videoTitle = aDecoder.decodeObject(forKey: "videoTitle") as! String
        let videoCategory = aDecoder.decodeObject(forKey: "videoCategory") as! String
        self.init(videoId: videoId, videoTitle: videoTitle, videoCateogry: videoCategory)

    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(videoId, forKey: "videoId")
        aCoder.encode(videoTitle, forKey: "videoTitle")
        aCoder.encode(videoCateogry, forKey: "videoCategory")

    }
    
}
