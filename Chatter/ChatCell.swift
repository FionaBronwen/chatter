//
//  ChatCell.swift
//  Chatter
//
//  Created by Fiona Thompson on 2/23/17.
//  Copyright © 2017 Fiona Thompson. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
