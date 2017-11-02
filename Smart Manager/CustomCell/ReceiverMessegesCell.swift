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
    
    func BindData()
    {
        receiverMessageLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        messagesDateTime.text = "10-07-17   19:05"
    }
    
    func addingSecrete(messageText: String) -> String
    {
        if(messageText.characters.count >= 41)
        {
            return messageText
        }
        else
        {
            return messageText// + "\n"
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
