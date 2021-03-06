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
    @IBOutlet var detailsTableView: UITableView!
    var emailSubject:String = ""
    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    @IBOutlet var listTableView: UITableView!
    
    //Custom Functions
    func loadView(storyBoardName:String, viewName:String, backButtonText:String, valuePassed:String)->Void{
        
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        if viewName == "htmlView" {
            let vc = storyboard.instantiateViewController(withIdentifier: viewName) as! htmldetails
            vc.htmlString = valuePassed
            navigationController?.pushViewController(vc, animated: true)
            let backButton = UIBarButtonItem(title: backButtonText, style:.plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
            
        }
        else {
            let vc = storyboard.instantiateViewController(withIdentifier: viewName) as UIViewController
            navigationController?.pushViewController(vc, animated: true)
            let backButton = UIBarButtonItem(title: backButtonText, style:.plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
            
        }
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    //TableView Functions
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        setHeaderTitle(tableView,  view: view, section: section)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .default, title: "More...") { (action, indexPath) in
            self.loadView(storyBoardName: "Main", viewName: "htmlView", backButtonText: "Back",valuePassed:(tableView.cellForRow(at: indexPath)?.textLabel!.accessibilityValue)!
                
            )
        }
        let action = [myAction]
        
        return action
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return emailSubject
        
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
        
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "BasicCell") as! customTableViewCell
        cell.textLabel!.text = item.Subject
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.accessibilityValue = item.Message
        
        return cell
        
    }

    //Generic Functions
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.lightGray
        super.viewDidLoad()
        self.title = "Diaspark Jobs Status"
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
        case "Jewel03 Modified PBLs":
            homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=diasparksql@gmail.com"
        default:
            homeModel.urlPath =  "http://traveller.photo/swift/service.php?V=noreply@sdccreations.com"
        }
        
        homeModel.delegate = self
        homeModel.downloadItems()
        
    }
}
