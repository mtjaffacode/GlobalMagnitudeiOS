//
//  GlobalMagnitudeUtils.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import Foundation
import UIKit

class GlobalMagnitudeUtils {
    class func generateRandomTwoDigitNumber() -> Int {
        let randomNumber = (arc4random() % 89) + 10
        return Int(randomNumber)
    }
    
    class func isMultiplicationCorrect(number1: Int, number2: Int, answer: Int) -> Bool {
        return number1 * number2 == answer
    }
    
    class func calculateResults() -> (totalTime: Double, correctCount: Int, incorrectCount: Int, score: Double, averageQuestionTime: Double) {
        let totalTime = Double(round(10*(GameUtil.instance.roundEndTime.timeIntervalSince1970 - GameUtil.instance.roundStartTime.timeIntervalSince1970))/10)
        var sumTime = 0.0
        var correctCount = 0
        for question in GameUtil.instance.questions {
            sumTime += question.timeToAnswer
            if question.correct {
                correctCount += 1
            }
        }
        
        let averageQuestionTime = Double(round(10*(sumTime / Double(GameUtil.instance.questions.count)))/10)
        let score = (Double(correctCount) / Double(GameUtil.instance.questions.count)) * 100
        
        return (totalTime, correctCount, GameUtil.instance.questions.count - correctCount, score, averageQuestionTime)
    }
    
//    class func calculateScore(questions: [GameQuestion]) -> Int {
//        
//    }
}

public extension UIColor {
    public class func darkerBlue()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 15/255, green: 78/255, blue: 101/255, alpha: 1)
        }
        return C.c
    }
    
    public class func lightertBlue()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 77/255, green: 181/255, blue: 217/255, alpha: 1)
        }
        return C.c
    }
}
