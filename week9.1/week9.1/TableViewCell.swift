//
//  TableViewCell.swift
//  week9.1
//
//  Created by Appzoc on 10/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lb2: UILabel!

    @IBOutlet weak var lb3: UILabel!
    @IBOutlet weak var lb1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
