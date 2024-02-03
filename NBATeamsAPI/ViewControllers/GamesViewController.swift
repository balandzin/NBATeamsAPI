//
//  ViewController.swift
//  NBATeamsAPI
//
//  Created by Антон Баландин on 30.01.24.
//

import UIKit

final class GamesViewController: UITableViewController {
    
    /*API (сведения об играх команд NBA)
    находится по адресу https://www.balldontlie.io/home.html#introduction
     */
    
    private var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchGames()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameCell
        
        let course = games[indexPath.row]
        //cell.configure(with: course)
        
        return cell
    }
}

// MARK: - Networking
extension GamesViewController {
    private func fetchGames() {
        
        URLSession.shared.dataTask(
            with: URL(string: "https://www.balldontlie.io/api/v1/games")!
        ) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let games = try JSONDecoder().decode(Games.self, from: data)
                print(games)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
