//
//  CustomTableViewCell.swift
//  Deadliner
//
//  Created by Muhammad Nobel Shidqi on 07/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activitiesCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.cornerRadius = 8
        baseView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        detailView.layer.cornerRadius = 8
        detailView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
