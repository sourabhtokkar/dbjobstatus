//
//  htmldetails.swift
//  database
//
//  Created by sourabh on 4/9/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class htmldetails: UIViewController {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return .landscape
        }
    }
    
    open override var shouldAutorotate: Bool {
        get {
            return true
        }
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            return .landscapeLeft
        }
    }

    
    @IBOutlet var webView: UIWebView!
    var htmlString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(htmlString, baseURL: nil)
        // Do any additional setup after loading the view.
        
  
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
    }
    
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
