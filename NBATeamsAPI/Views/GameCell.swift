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
        gamesLabel.text = "\(game.homeTeam.fullName) - \(game.visitorTeam.fullName)"
        dateLabel.text = "Date: \(game.date)"
    }
}
