//
//  SenderMessageCell.swift
//  WeatherBot
//
//  Created by Anoop tomar on 3/2/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class SenderMessageCell: UITableViewCell {
    
    @IBOutlet weak var senderLabel: PaddedLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
