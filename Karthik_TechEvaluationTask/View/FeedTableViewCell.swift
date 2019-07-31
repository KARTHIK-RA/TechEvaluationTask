//
//  FeedTableViewCell.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var m_FeedImageView: UIImageView!
    @IBOutlet weak var m_TitleLbl: UILabel!
    @IBOutlet weak var m_DescriptionLbl: UILabel!
    @IBOutlet weak var m_DateLbl: UILabel!
    
    var feed : Feed! {
        didSet {
            if !self.feed.image.isEmpty  {
                self.m_FeedImageView.setImageAndAnimate(url : URL(string: self.feed.image)! ,placeholder : "profile_water_mark")
            }else {
                self.m_FeedImageView.image = UIImage(named: "profile_water_mark")
            }
            m_TitleLbl.text = feed.title
            m_DescriptionLbl.text = feed.description
            m_DateLbl.text = feed.date
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
