//
//  htmldetails.swift
//  database
//
//  Created by sourabh on 4/9/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class htmldetails: UIViewController {

    //Variables
    @IBOutlet var webView: UIWebView!
    var htmlString:String = ""
    
    //Custom Functions
    func canRotate() -> Void {}
    
    //Generic Functions
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.lightGray
        self.title = "Modified PBLs Since Yesterday"
        super.viewDidLoad()
        webView.loadHTMLString(htmlString, baseURL: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
