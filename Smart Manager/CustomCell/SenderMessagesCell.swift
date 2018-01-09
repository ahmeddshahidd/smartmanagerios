//
//  SenderMessagesCell.swift
//  Template
//
//  Created by Ahmed Shahid on 7/28/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class SenderMessagesCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var messengerImage: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    
    func BindData(messageObj: Message)
    {
        messageLabel.text = messageObj.message
        messageDate.text = messageObj.createDate
    }
    
    func configView() {
        self.bgView.layer.masksToBounds = false
        self.bgView.layer.shadowColor = AppConstants.THEME_COLOR_LIGHT_GRAY.cgColor
        self.bgView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.bgView.layer.shadowOpacity = 0.7
    }
}
