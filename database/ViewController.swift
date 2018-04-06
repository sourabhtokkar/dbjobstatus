//
//  ViewController.swift
//  database
//
//  Created by sourabh on 2/26/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol  {
    
    //Properties
    var emailSubject:String = ""
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        
        switch emailSubject{
        case "SD Creations":
            homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=noreply@sdccreations.com"
        case "SDC Designs":
            homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=diaspark@sdcdesigns.com"
        case "HK Designs":
             homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=diaspark@hk.co"
        default:
            homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=noreply@sdccreations.com"
        }
        
        
        homeModel.delegate = self
        homeModel.downloadItems()
        
    }
     
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UITextView()
        
        headerText.textAlignment = .center
        headerText.text = emailSubject
        
        
        return headerText
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Diaspark Jobs Status"
        
    }
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.Message
        
        myCell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        myCell.textLabel!.numberOfLines = 0
        
        return myCell
    }
    
   
}
