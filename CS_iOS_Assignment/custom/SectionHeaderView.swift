//
//  SectionHeaderView.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    
    @IBOutlet weak var lblSectionTitle: UILabel!
    
    class func instanceFromNib(index : Int) -> UIView {
        return UINib(nibName: "SectionHeaderView", bundle: nil).instantiate(withOwner: self, options: nil)[index] as! UIView
    }
    
    /**
     * Configure title for section header
     */
    func configure(sectionTitle: String) {
        lblSectionTitle.text = sectionTitle
    }
}
