//
//  NotificationNewCell.swift
//  Template
//
//  Created by Ahmed Shahid on 7/31/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class NotificationNewCell: UITableViewCell {
    
    @IBOutlet weak var notiDateAndTime: UILabel!
    @IBOutlet weak var notiMainDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func BindData()
    {
//        self.notiMainDescription.text = notification.message
//        self.notiDateAndTime.text = self.createDateString(withDate: notification.date)
        
        //        if(notification.type == "admin")
        //        {
        //            self.selectionStyle = .none
        //        }
        //        else
        //        {
        //            self.selectionStyle = .default
        //        }
        
        self.notiMainDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        
        self.notiDateAndTime.text = "02-11-17  19:04"
    }
    
    func createDateString(withDate dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        //dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateStr) //according to date format your date string
        print(date ?? "") //Convert String to Date
        dateFormatter.dateFormat = "dd-MM-yy  HH:mm"
        return dateFormatter.string(from: date!)//""//"  \(date) | \(time)"
    }
    
}
