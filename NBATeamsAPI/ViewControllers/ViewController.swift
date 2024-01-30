//
//  ViewController.swift
//  NBATeamsAPI
//
//  Created by Антон Баландин on 30.01.24.
//

import UIKit

final class ViewController: UIViewController {
    
    /*API (сведения об играх команд NBA)
    находится по адресу https://www.balldontlie.io/home.html#introduction
     */
    
    private let link = URL(string: "https://www.balldontlie.io/api/v1/games")!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTeam()
    }
    
    private func fetchTeam() {
        
        URLSession.shared.dataTask(with: link) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let games = try JSONDecoder().decode(Games.self, from: data)
                print(games)
            } catch {
                print(error)
            }
        }.resume()
    }
}
