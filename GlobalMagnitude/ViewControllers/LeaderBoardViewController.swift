//
//  LeaderBoardViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startRoundButton: UIButton!
    
    private var loading: Bool = true
    var leaderBoardData: [UserScoreEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.layer.borderColor = UIColor.lightertBlue().cgColor
        tableView.layer.borderWidth = 2.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func loadData() {
        self.loading = true
        self.tableView.reloadData()
        LeaderBoardConnection.GetLeaderBoard { (entries, error) in
            if let entries = entries {
                self.leaderBoardData = entries
                self.loading = false
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func startNewRound() {
        GameUtil.instance.questions = []
        if GameUtil.instance.handle != nil {
            // show questions
            if let questionsViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") {
                present(questionsViewController, animated: true, completion: nil)
            }
        } else {
            if let handleViewController = storyboard?.instantiateViewController(withIdentifier: "HandleViewController") {
                present(handleViewController, animated: true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LeaderBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loading {
            return 1
        } else {
            return leaderBoardData.count
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if loading {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell") {
                return cell
            }
        } else {
            let entry = self.leaderBoardData[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardEntryCell", for: indexPath) as? LeaderBoardEntryTableViewCell {
                cell.screenNameLabel.text = entry.userid
                cell.scoreLabel.text = "\(entry.score ?? 0)"
                cell.averageQuestionTimeLabel.text = "Average Question Time: \(entry.qtime ?? 0.0)"
                cell.totalCompletionTimeLabel.text = "Total Completion Time: \(entry.mtime ?? 0.0)"
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? HandleViewController,
            segue.identifier == "goToHandleViewController" {
            viewController.whenDoneDismiss = true
        }
    }
}
