//
//  PlaySavedVideoViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 8/14/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import SVProgressHUD

class PlaySavedVideoViewController: UIViewController {
    
    
    var videoId:String = ""
    @IBOutlet weak var savedVideoView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let videoUrl = URL(string: "https://www.youtube.com/watch?v=" + self.videoId)
        let requestObj = URLRequest(url: videoUrl!)
        savedVideoView.loadRequest(requestObj)
        
    }
}
