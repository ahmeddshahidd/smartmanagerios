//
//  TaskCell.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 12/19/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskStatus: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
