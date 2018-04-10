//
//  htmldetails.swift
//  database
//
//  Created by sourabh on 4/9/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class htmldetails: UIViewController {
    
    
    
    
    
    @IBOutlet var webView: UIWebView!
    var htmlString:String = ""
    
    override func viewDidLoad() {
        
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
    
    func canRotate() -> Void {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
