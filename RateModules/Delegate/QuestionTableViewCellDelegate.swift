//
//  QuestionTableViewCellDelegate.swift
//  RateModule1
//
//  Created by Adrian Tineo on 26.01.20.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import Foundation

protocol QuestionTableViewCellDelegate {
    func didToggleSwitch(for question: Question, value: Bool)
}
