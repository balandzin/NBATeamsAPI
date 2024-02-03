//
//  GameDetailsViewController.swift
//  NBATeamsAPI
//
//  Created by Антон Баландин on 3.02.24.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    @IBOutlet var gameDetailsLabel: UILabel!
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        gameDetailsLabel.text = game.description
    }
}
