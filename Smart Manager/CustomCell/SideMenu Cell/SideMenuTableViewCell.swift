//
//  SideMenuTableViewCell.swift
//  Template
//
//  Created by alijabbar on 3/18/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    open class func height() -> CGFloat {
        return 60
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            let selectedView:UIView = UIView()
            selectedView.backgroundColor = Constants.THEME_COLOR_LIGHT
            self.selectedBackgroundView? = selectedView
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            let selectedView:UIView = UIView()
            selectedView.backgroundColor = Constants.THEME_COLOR_LIGHT
            self.selectedBackgroundView? = selectedView
        }
    }

}
