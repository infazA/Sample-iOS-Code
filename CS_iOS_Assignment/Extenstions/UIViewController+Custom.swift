//
//  UIViewController+Custom.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    func showAlertWith(message: AlertMessage , style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func shouldHideLoader(isHidden: Bool) {
           if isHidden {
               MBProgressHUD.hide(for: self.view, animated: true)
           } else {
               MBProgressHUD.showAdded(to: self.view, animated: true)
           }
       }
}
