//
//  GameUtil.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import Foundation

class GameQuestion {
    var number1: Int = 0
    var number2: Int = 0
    var answer: Int = 0
    var correct: Bool = false
    var timeToAnswer: Double = 0.0
}

class GameUtil {
    static private var _instance: GameUtil? = nil
    static var instance: GameUtil {
        get {
            if let _instance = _instance {
                return _instance
            }
            
            _instance = GameUtil()
            return _instance!
        }
    }
    
    private init() {
        handle = UserDefaults(suiteName: "GlobalMagnitude")?.string(forKey: "Handle")
    }
    
    private func saveHandle(handle: String) {
        if let defaults = UserDefaults(suiteName: "GlobalMagnitude") {
            defaults.set(handle, forKey: "Handle")
            defaults.synchronize()
        }
    }
    
    var questions: [GameQuestion] = []
    var roundStartTime: Date = Date()
    var roundEndTime: Date = Date()
    
    var handle: String? {
        didSet {
            if let handle = handle {
                saveHandle(handle: handle)
            }
        }
    }
}
