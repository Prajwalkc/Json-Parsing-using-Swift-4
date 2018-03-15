//
//  JsonDataTableViewCell.swift
//  JsonParse
//
//  Created by Prajwal kc on 2/21/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class JsonDataTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var labelCapital: UILabel!
    @IBOutlet weak var labelRegion: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
}
