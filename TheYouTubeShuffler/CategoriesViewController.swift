
//
//  CategoriesViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 7/15/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var categoriesArray: [String] = ["Funnyy", "Sports","Science and Technology", "Music", "Animals", "Popular", "Random"]
    var imagesArray = [UIImage]()
    var selectedCategory: String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false

        self.title = "The YouTube Shuffler"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        imagesArray.append((UIImage(named: "Music.png")!))
        imagesArray.append((UIImage(named: "Sports.png")!))
        imagesArray.append((UIImage(named: "Science.png")!))
        imagesArray.append((UIImage(named: "Music.png")!))
        imagesArray.append((UIImage(named: "Animals.png")!))
        imagesArray.append((UIImage(named: "Popular.png")!))
        imagesArray.append((UIImage(named: "Random.png")!))
        
       


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.view.frame.size.width / 320) * 72
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("category")
        
        cell!.textLabel!.text = categoriesArray[indexPath.row]
        cell?.imageView?.image = imagesArray[indexPath.row]
        
        return cell!
        
        
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.textLabel!.font = UIFont(name:"Avenir", size:22)
        cell.textLabel?.textColor = UIColor.blackColor()
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCategory = categoriesArray[indexPath.row]

        self.performSegueWithIdentifier("showVideo", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let videoPage = segue.destinationViewController as! PlayVideoViewController
        videoPage.selectedCategory = selectedCategory
        
    }

}
