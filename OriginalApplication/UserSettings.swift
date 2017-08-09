//
//  UserSettings.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/08/08.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import Foundation
import UIKit
import Charts

class UserSettings: NSObject, NSCoding{
    var color:UIColor? = UIColor(displayP3Red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
    
    override init(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        color = (aDecoder.decodeObject(forKey: "color") as? UIColor)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(color,forKey: "color")
    }
}
