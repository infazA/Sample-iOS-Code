//
//  AlertMessage.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

class AlertMessage: Error {
    
    var title = AlertTitle.defaultAlertTitle
    var body = AlertTitle.defaultAlertTitle
    
    init(title : String,body : String) {
        self.title = title
        self.body = body
        print("title \(title) : body \(body)")
    }
}
