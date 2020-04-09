//
//  ActivityTableViewCell.swift
//  Deadliner
//
//  Created by Muhammad Iksanul on 09/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameActivity: UILabel!
    @IBOutlet weak var priorityActivity: UILabel!{
        didSet{
            priorityActivity.layer.cornerRadius = 5
            priorityActivity.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var timerActivity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTimerActivity(timer: String){
        let attachment = NSTextAttachment()
        let icon = UIImage(systemName: "timer")
        attachment.image = icon
        
        let image = NSAttributedString(attachment: attachment)
        
        let full = NSMutableAttributedString()
        full.append(image)
        full.append(NSAttributedString(string: timer))
        
        timerActivity.attributedText = full
    }
}
