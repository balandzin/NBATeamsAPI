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
    let fullName: String
    let name: String
}

struct Game: Decodable {
    let date: String
    let season: Int
    let homeTeam: Team
    let homeTeamScore: Int
    let visitorTeam: Team
    let visitorTeamScore: Int

    var description: String {
        """
        Date: \(date)
        Season: \(season)
        \(homeTeam.name) - \(visitorTeam.name)
        \(homeTeam.city) - \(visitorTeam.city)
        \(homeTeamScore) - \(visitorTeamScore)
        """
    }
}

struct Games: Decodable {
    let data: [Game]
}
