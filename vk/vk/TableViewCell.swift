//
//  TableViewCell.swift
//  vk
//
//  Created by Appzoc on 08/09/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var imag: UIImageView!

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
