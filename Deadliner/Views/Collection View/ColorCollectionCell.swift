//
//  ColorCollectionCell.swift
//  Deadliner
//
//  Created by Muhammad Nobel Shidqi on 07/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class ColorCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var indicatorBar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShapeLayer()
    }
    
    func setShapeLayer() {
        baseView.layer.masksToBounds = true
        baseView.layer.cornerRadius = baseView.frame.height / 2
    }
}
