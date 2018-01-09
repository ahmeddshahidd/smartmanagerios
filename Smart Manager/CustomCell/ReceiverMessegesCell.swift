//
//  ReceiverMessegesCell.swift
//  Template
//
//  Created by Ahmed Shahid on 7/28/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class ReceiverMessegesCell: UITableViewCell {
    @IBOutlet weak var receiverMessageLabel: UILabel!
    
    @IBOutlet weak var messagesDateTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func BindData(messageObj: Message)
    {
        receiverMessageLabel.text = messageObj.message
        messagesDateTime.text = messageObj.createDate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
