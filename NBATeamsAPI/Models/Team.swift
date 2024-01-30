//
//  Team.swift
//  NBATeamsAPI
//
//  Created by Антон Баландин on 30.01.24.
//

import Foundation

struct Team: Decodable {
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
}

struct Game: Decodable {
    let date: String
    let season: Int
    let home_team: Team
    let home_team_score: Int
    let visitor_team: Team
    let visitor_team_score: Int
}

struct Games: Decodable {
    let data: [Game]
}
