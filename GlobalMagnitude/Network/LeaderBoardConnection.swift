//
//  LeaderBoardConnection.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import Foundation
import Alamofire

class LeaderBoardConnection {
    class func GetLeaderBoard(callback: @escaping (_ leaderBoard: [UserScoreEntry]?, _ error: String?) -> Void) {
        if let url = URL(string: "https://misc.tealdrones.com/global-magnitude/leaderboard") {
            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                guard let data = response.data else {
                    callback(nil, "Failed to retrieve leaderboard")
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let leaderBoardResults = try decoder.decode([UserScoreEntry].self, from: data)
                    callback(leaderBoardResults, nil)
                } catch {
                    callback(nil, "Failed to retrieve leaderboard")
                }
            }
        } else {
            callback(nil, "Failed to find host")
        }
    }
    
    class func SaveEntryToLeaderBoard(entry: UserScoreEntry, callback: @escaping (_ leaderBoard: [UserScoreEntry]?, _ error: String?) -> Void) {
        if let url = URL(string: "https://misc.tealdrones.com/global-magnitude/leaderboard") {
            do {
                let userScore = try entry.toDictionary()
                Alamofire.request(url, method: .post, parameters: userScore, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                    guard let data = response.data else {
                        callback(nil, "Failed to retrieve leaderboard")
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        let leaderBoardResults = try decoder.decode([UserScoreEntry].self, from: data)
                        callback(leaderBoardResults, nil)
                    } catch {
                        callback(nil, "Failed to retrieve leaderboard")
                    }
                }
            } catch {
                callback(nil, "Failed to prepare data")
            }
        } else {
            callback(nil, "Failed to find host")
        }
    }
}
