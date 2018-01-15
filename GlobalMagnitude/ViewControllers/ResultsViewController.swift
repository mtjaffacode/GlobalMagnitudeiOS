//
//  ResultsViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var answerPercentageLabel: UILabel!
    @IBOutlet weak var averageQuestionTimeLabel: UILabel!
    @IBOutlet weak var totalMatchTimeLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var incorrectAnswersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let results = GlobalMagnitudeUtils.calculateResults()
        answerPercentageLabel.text = "Score: \(Int(results.score))%"
        averageQuestionTimeLabel.text = "Your average question time is \(results.averageQuestionTime) seconds"
        totalMatchTimeLabel.text = "Total time to complete match \(results.totalTime) seconds"
        correctAnswersLabel.text = "Total correct answers: \(results.correctCount)"
        incorrectAnswersLabel.text = "Total incorrect answers: \(results.incorrectCount)"
        let entry = UserScoreEntry(userid: GameUtil.instance.handle, score: Int(results.score), mtime: results.totalTime, qtime: results.averageQuestionTime)
        LeaderBoardConnection.SaveEntryToLeaderBoard(entry: entry, callback: { (entries, error) in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}
