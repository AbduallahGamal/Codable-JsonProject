//
//  customView.swift
//  Codable+JsonProject
//
//  Created by Abdalla on 2/22/20.
//  Copyright © 2020 edu.data. All rights reserved.
//

import Foundation
import UIKit

class customView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRaduisAndShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRaduisAndShadow()
    }
    
    func setRaduisAndShadow(){
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
    }
}
