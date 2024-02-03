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
    
    private var games: Games!
    private var gameData: [Game] = []
    private let networkManager = NetworkManager.shared
    private let url = URL(string: "https://www.balldontlie.io/api/v1/games")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchGames()
    }
    
// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameCell
        let game = gameData[indexPath.row]
        cell.configure(with: game)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsVC = segue.destination as? GameDetailsViewController
        detailsVC?.game = gameData[indexPath.row]
    }
}

// MARK: - Networking
extension GamesViewController {
    
    private func fetchGames() {
        networkManager.fetch(Games.self, from: url!) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let games):
                self.games = games
                gameData = games.data
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
