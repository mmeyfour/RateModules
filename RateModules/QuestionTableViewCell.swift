//
//  QuestionTableViewCell.swift
//  RateModule1
//
//  Created by Adrian Tineo on 26.01.20.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionTableViewCell"
    var delegate: QuestionTableViewCellDelegate?
    private var question: Question?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var isPassedSwitch: UISwitch!
    
    @IBAction func didToggleSwitch(_ sender: UISwitch) {
        guard let question = question else { return }
        delegate?.didToggleSwitch(for: question, value: isPassedSwitch.isOn)
    }
    
    func configure(with question: Question) {
        self.question = question
        titleLabel.text = question.title
        descriptionLabel.text = question.description
        isPassedSwitch.isOn = question.isPassed
        
    }
    
}
