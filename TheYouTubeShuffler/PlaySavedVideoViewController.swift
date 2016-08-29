//
//  PlaySavedVideoViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 8/14/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit
import YouTubePlayer

class PlaySavedVideoViewController: UIViewController {
//
//    @IBOutlet weak var videoPlayer: YouTubePlayerView!
//    
    
    @IBOutlet var videoPlayer: YouTubePlayerView!


    var videoId:String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height + 44
        self.videoPlayer.loadVideoID(self.videoId)
        
        if videoPlayer.ready {
            print("1")
            if videoPlayer.playerState != YouTubePlayerState.Playing {
                print("2")
                videoPlayer.play()
                print("3")
            }
        }

            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func playerReady(videoPlayer: YouTubePlayerView) {
//        if videoPlayer.ready {
//            if videoPlayer.playerState != YouTubePlayerState.Playing {
//                videoPlayer.play()
//            
//            }
//        }
//            
//            }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
