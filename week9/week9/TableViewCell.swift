//
//  TableViewCell.swift
//  week9
//
//  Created by Appzoc on 08/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
