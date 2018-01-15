//
//  UserScoreEntry.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import Foundation

struct UserScoreEntry: Codable {
    var userid: String?
    var score: Int?
    var mtime: Double?
    var qtime: Double?
}
