//
//  AlarmTableViewCell.swift
//  Dispatch_Practice
//
//  Created by 박민서 on 2023/05/10.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AlarmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
