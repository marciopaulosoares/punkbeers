//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by marcio paulo on 7/16/17.
//  Copyright © 2017 marcio paulo. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var IvImage: UIImageView!
    @IBOutlet weak var LbName: UILabel!
    @IBOutlet weak var LbAbv: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
