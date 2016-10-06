
//
//  CategoriesViewController.swift
//  TheYouTubeShuffler
//
//  Created by Kasra Sheik on 7/15/16.
//  Copyright © 2016 Kasra Sheik. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    var categoriesArray: [String] = ["Funny", "Sports","Science and Technology", "Music", "Animals", "Popular", "Random"]
    var imagesArray = [UIImage]()
    var selectedCategory: String = ""
    
    @IBOutlet weak var tabBar: UITabBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false

        self.title = "The YouTube Shuffler"
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tabBar.delegate = self
        self.tabBar.tintColor = UIColor(red: 204/255.0, green: 24/255.0, blue: 30/255.0, alpha: 1)
        
        
        imagesArray.append((UIImage(named: "Funny.png")!))
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return (self.view.frame.size.width / 320) * 72
          return (self.view.frame.size.width / 320) * 67.5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category")
        
        cell!.textLabel!.text = categoriesArray[(indexPath as NSIndexPath).row]
        cell?.imageView?.image = imagesArray[(indexPath as NSIndexPath).row]
        
        return cell!
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //original font size22
        cell.textLabel!.font = UIFont(name:"Avenir", size:19)
        cell.textLabel?.textColor = UIColor.black

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categoriesArray[(indexPath as NSIndexPath).row]

        self.performSegue(withIdentifier: "showVideo", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: false)
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 1) {
            self.performSegue(withIdentifier: "myVideos", sender: self)
        }
        else if(item.tag == 2) {
            self.performSegue(withIdentifier: "moreInfo", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showVideo") {
            let videoPage = segue.destination as! PlayVideoViewController
            videoPage.selectedCategory = selectedCategory
        }
    }

}
