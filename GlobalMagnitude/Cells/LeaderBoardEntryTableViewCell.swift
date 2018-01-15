//
//  LeaderBoardEntryTableViewCell.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class LeaderBoardEntryTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var averageQuestionTimeLabel: UILabel!
    @IBOutlet weak var totalCompletionTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
