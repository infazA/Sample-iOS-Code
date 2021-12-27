//
//  UIImageView+Custom.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

extension UIImageView {
    func downloaded(from link: String,placeholder: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        let placeHolderImg = UIImage.init(named: placeholder )
        sd_setImage(with: URL(string: link),placeholderImage: placeHolderImg) { (dowloadedImage, error, SDWebImageRefreshCached, imageURL) in
            self.contentMode = .scaleAspectFill
            self.clipsToBounds = true
            if ((dowloadedImage) == nil) {
                self.image = placeHolderImg
            }else{
                self.image = dowloadedImage
            }
        }
    }
}
