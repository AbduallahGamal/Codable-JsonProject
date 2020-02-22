//
//  GradientView.swift
//  Codable+JsonProject
//
//  Created by Abdalla on 2/22/20.
//  Copyright © 2020 edu.data. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor:UIColor = UIColor.clear{didSet{VD()}}
    @IBInspectable var secondColor:UIColor = UIColor.clear{didSet{VD()}}
    
    override class var layerClass:AnyClass{
        get{return CAGradientLayer.self}
    }
    
    func VD(){
        let lay = self.layer as! CAGradientLayer
        lay.colors = [firstColor.cgColor, secondColor.cgColor]
    }
}
