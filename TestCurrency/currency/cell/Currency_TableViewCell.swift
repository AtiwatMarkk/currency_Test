//
//  Currency_TableViewCell.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 19/6/2566 BE.
//

import UIKit

class Currency_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var currency_lb: UILabel!
    @IBOutlet weak var currency_current: UILabel!
    @IBOutlet weak var btn_history: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
