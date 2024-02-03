//
//  GameCellTableViewCell.swift
//  NBATeamsAPI
//
//  Created by Антон Баландин on 3.02.24.
//

import UIKit

final class GameCell: UITableViewCell {
    
    @IBOutlet var gamesLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
