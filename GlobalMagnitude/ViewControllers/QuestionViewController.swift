//
//  QuestionViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var number1View: CircleView!
    @IBOutlet weak var number2View: CircleView!
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var multiplierView: CircleView!
    @IBOutlet weak var answerView: RoundedView!
    @IBOutlet weak var statusView: RoundedView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var answer5Button: UIButton!
    @IBOutlet weak var answer6Button: UIButton!
    
    var buttons: [UIButton] = []
    
    var currentQuestion: GameQuestion? = nil
    
    var timer: Timer? = nil
    var questionStartTime: Date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttons = [answer1Button, answer2Button, answer3Button, answer4Button, answer5Button, answer6Button]
        GameUtil.instance.roundStartTime = Date()
        startQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setupIntialViews() {
//        let width = self.view.frame.width
//        let height = self.view.frame.height
//    }
    
    func startQuestion() {
        let newQuestion = GameQuestion()
        headerLabel.text = "Question \(GameUtil.instance.questions.count + 1)"
        newQuestion.number1 = GlobalMagnitudeUtils.generateRandomTwoDigitNumber()
        newQuestion.number2 = GlobalMagnitudeUtils.generateRandomTwoDigitNumber()
        currentQuestion = newQuestion
        questionStartTime = Date()
        
        let realAnswer = newQuestion.number1 * newQuestion.number2
        var randomNumber: [Int] = []
        for _ in 0...5 {
            let random = (arc4random() % 200)
            randomNumber.append(realAnswer + Int(random) - 100)
        }
        randomNumber.insert(realAnswer, at: Int(arc4random() % 4))
        
        var index = 0
        for button in buttons {
            button.tag = randomNumber[index]
            button.setTitle("\(button.tag)", for: .normal)
            index += 1
        }
        
        number1Label.text = "\(newQuestion.number1)"
        number2Label.text = "\(newQuestion.number2)"
        
        timerLabel.text = "0 seconds"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            let currentTime = Date()
            let seconds = Int(currentTime.timeIntervalSince1970 - self.questionStartTime.timeIntervalSince1970)
            DispatchQueue.main.async {
                self.timerLabel.text = "\(seconds) second(s)"
            }
        })


        // to do animate bubble out and in when new questions begin.
//        UIView.animate(withDuration: 1.0) {
//            statusView.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
//        }
    }
    
    @IBAction func answerQuestion(sender: UIButton) {
        let currentTime = Date()
        let timeToAnswer = currentTime.timeIntervalSince1970 - questionStartTime.timeIntervalSince1970
        timer?.invalidate()
        if let question = currentQuestion {
            question.answer = sender.tag
            question.correct = GlobalMagnitudeUtils.isMultiplicationCorrect(number1: question.number1, number2: question.number2, answer: question.answer)
            question.timeToAnswer = timeToAnswer
            GameUtil.instance.questions.append(question)
            
            if GameUtil.instance.questions.count >= 20 {
                GameUtil.instance.roundEndTime = Date()
                
                if let resultsViewController = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") {
                    present(resultsViewController, animated: true, completion: nil)
                }
                
                // we are done, present results
//                let entry = UserScoreEntry(userid: GameUtil.instance.handle, score: <#T##Int?#>, mtime: <#T##Double?#>, qtime: <#T##Double?#>)
            } else {
                startQuestion()
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }

}
