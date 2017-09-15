//
//  Cell.swift
//  loginswift
//
//  Created by Appzoc on 17/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet var lb: UILabel!

    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
