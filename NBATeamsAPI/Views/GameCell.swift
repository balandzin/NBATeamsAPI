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

    func configure(with game: Game) {
        //gamesLabel.text = "\(game.home_team) - \(game.visitor_team)"
        gamesLabel.text = "\(game.home_team.full_name) - \(game.visitor_team.full_name)"
        dateLabel.text = "Date: \(game.date)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
