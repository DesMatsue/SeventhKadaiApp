//
//  ActivityAmount.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/08/03.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import RealmSwift

class ActivityAmount: Object{
    // 管理用ID
    dynamic var date = NSDate()
    
    // 実データフィールド
    dynamic var activityAmount: Double = 0

    override static func primaryKey() -> String?{
        return "date"
    }
}
