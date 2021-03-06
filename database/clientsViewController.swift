//
//  clientsViewController.swift
//  database
//
//  Created by sourabh on 3/25/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class clientsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

   
   //Variables : Properties
    @IBOutlet var clientTableView: UITableView!
    
    let clients = ["SD Creations", "SDC Designs", "HK Designs", "Jewel03 Modified PBLs"]
    
    //Custom Functions
    func loadView(storyBoardName:String, viewName:String, backButtonText:String, valuePassed:String)->Void{
        
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        if viewName == "detailView" {
            let vc = storyboard.instantiateViewController(withIdentifier: viewName) as! ViewController
            vc.emailSubject = valuePassed
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
    
   
    //TableView Functions
    func getSectionTitle( table : UITableView, section_no:Int) -> String{
        
        var secttionTitle :String
        
        secttionTitle = tableView(table, titleForHeaderInSection: section_no)!
        return secttionTitle
    }
    
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .default, title: "Details") { (action, indexPath) in
            self.loadView(storyBoardName: "Main", viewName: "detailView", backButtonText: "Back",valuePassed:(tableView.cellForRow(at: indexPath)?.textLabel!.text)!
               
            )
        }
        let action = [myAction]
        
        return action
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        setHeaderTitle(tableView,  view: view, section: section)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return "Clients List"
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
       let cell = clientTableView.dequeueReusableCell(withIdentifier: "customCell") as! customTableViewCell
       
        cell.textLabel!.text = clients[indexPath.row]
        
        return cell
        
    }
    
 
    //Generic Functions
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.lightGray
        
        //self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
        self.title = "Diaspark Jobs Status"
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.clientTableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
