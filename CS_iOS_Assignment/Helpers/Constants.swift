//
//  Constants.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

enum AlertTitle {
    static let successAlertTitle = "Success"
    static let defaultAlertTitle = "Warning"
    static let errorAlertTitle = "Error"
}

enum AlertBody {
    static let genericErrorMessage = "Something went wrong, please try again."
}

//Base URL for movies thumbnail images
enum BaseURL {
    static let dev = "https://image.tmdb.org/t/p/original"
}
