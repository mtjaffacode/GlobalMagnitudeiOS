//
//  HandleViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class HandleViewController: UIViewController {
    @IBOutlet weak var handleTextView: UITextField!
    
    var whenDoneDismiss = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        handleTextView.text = GameUtil.instance.handle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueToQuestions() {
        if let handle = handleTextView.text, !handle.isEmpty {
            GameUtil.instance.handle = handleTextView.text
            if whenDoneDismiss {
                dismiss(animated: true, completion: nil)
            } else {
                if let questionsViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") {
                    present(questionsViewController, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Incorrect handle name", message: "Please enter a non blank handle name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }

}
