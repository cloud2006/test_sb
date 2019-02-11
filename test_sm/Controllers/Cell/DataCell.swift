//
//  DataCell.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/11/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit
import SDWebImage

class DataCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    var dataItem: Data? {
        didSet {
            guard let item = dataItem else { return  }
            itemImageView.layer.cornerRadius = 33
            itemImageView.sd_setImage(with: URL(string: item.smallImage))
            mainTitleLabel.text = item.title
            secondTitleLabel.text = item.shortDescription
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
