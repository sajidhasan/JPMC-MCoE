//
//  PlanetsTableViewCell.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 13/06/2022.
//

import UIKit

class PlanetsTableViewCell: UITableViewCell {

    @IBOutlet weak var planetNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
