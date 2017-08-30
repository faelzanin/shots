//
//  ShotDetailCollectionViewCell.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class ShotDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setShot(shot : Shot) {
        self.titleLabel.text = shot.title ?? ""
        self.viewsCountLabel.text = String.init(format: "%d", shot.viewsCount!) + " views"
        self.createdAtLabel.text = DateUtil.sharedInstance.formatDate(string: shot.createdAt!)
        self.shotImageView.sd_setImage(with: URL.init(string: shot.imageNormalUrl!))
        
        self.descriptionLabel.attributedText = shot.descript?.htmlToAttributedString
        self.commentsCountLabel.text = String.init(format: "%d", shot.commentsCount!) + " comments"
    }
  
    
}
