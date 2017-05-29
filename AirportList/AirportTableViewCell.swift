//
//  AirportTableViewCell.swift
//  AirportList
//
//  Created by 林晏竹 on 2017/5/29.
//  Copyright © 2017年 林晏竹. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var IATACodeLabel: UILabel!
    @IBOutlet weak var servedCityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
