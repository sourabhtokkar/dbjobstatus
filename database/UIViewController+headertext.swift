//
//  UIViewController+headertext.swift
//  database
//
//  Created by diaspark on 4/10/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit
extension UIViewController {
    func setHeaderTitle(_ tableView: UITableView, view: UIView, section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textAlignment = .center
            headerView.backgroundView?.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        }
    }
}
