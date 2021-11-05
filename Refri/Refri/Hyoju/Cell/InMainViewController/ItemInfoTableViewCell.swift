//
//  ItemInfoTableViewCell.swift
//  Refri
//
//  Created by simyo on 2021/11/05.
//

import UIKit

class ItemInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var ItemDescriptionLabel: UILabel!
    @IBOutlet weak var ItemDurationLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var ItemDdayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
