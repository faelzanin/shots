//
//  ShotTableViewCell.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit
import SDWebImage

class ShotTableViewCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setShot(shot : Shot) {
        self.titleLabel.text = shot.title ?? ""
        self.viewsCountLabel.text = String.init(format: "%d", shot.viewsCount!) + " views"
        self.createdAtLabel.text = DateUtil.sharedInstance.formatDate(string: shot.createdAt!)
        self.shotImageView.sd_setImage(with: URL.init(string: shot.imageNormalUrl!))
    }
    
   
}
