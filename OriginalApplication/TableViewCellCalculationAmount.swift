//
//  TableViewCellCalculationAmount.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/08/06.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit

class TableViewCellCalculationAmount: UITableViewCell {
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ date: String, _ amount: String){
        self.date.text = date
        self.amount.text = amount
    }
}
