//
//  FlagTableViewCell.swift
//  FlagsOfTheWorldRevisedApp
//
//  Created by adil gupta on 17/04/20.
//  Copyright © 2020 priyam. All rights reserved.
//

import UIKit

class FlagTableViewCell: UITableViewCell {

    @IBOutlet weak var flagLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    func update(with flag: Flag) {
        flagLabel.text = flag.flag
        countryLabel.text = flag.country
        regionLabel.text = "located in \(flag.region) with a population of \(flag.population)"
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
