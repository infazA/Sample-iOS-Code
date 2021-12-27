//
//  ErrorModel.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

class ErrorModel: Codable {
    let status: String?
    let code: String?
    let message: String?
    let result: String?
}

