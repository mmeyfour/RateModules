//
//  RateModuleViewController.swift
//  RateModule1
//
//  Created by Adrian Tineo on 26.01.20.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import UIKit

class RateModuleViewController: UITableViewController {
    
    var state = State(module: Module.module3B)
    var modulChused: Module?
    var firstName: String?
    var lastName: String?
    
    static let rateModuleSegue = "showRateModule"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let optionChosed = modulChused {
            navigationItem.title = optionChosed.rawValue
        }
    }
    
    private func update(selectedQuestion: Question, with value: Bool) {
        var index = state.designQuestions?.firstIndex { $0.title == selectedQuestion.title }
        if let index = index {
            state.designQuestions![index].isPassed = value
            return
        }
        
        index = state.requirementsQuestions.firstIndex { $0.title == selectedQuestion.title }
        if let index = index {
            state.requirementsQuestions[index].isPassed = value
            return
        }
        
        index = state.codeStructureQuestions.firstIndex { $0.title == selectedQuestion.title }
        if let index = index {
            state.codeStructureQuestions[index].isPassed = value
            return
        }
        
        index = state.cleanCodeQuestions.firstIndex { $0.title == selectedQuestion.title }
        if let index = index {
            state.cleanCodeQuestions[index].isPassed = value
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRateResults", let destination = segue.destination as? RateResultsViewController {
            destination.rateCalculator = RateCalculator(
                numberOfDesignQuestions: state.hasDesignSection ? state.designQuestions!.count : 0,
                numberOfRightlyAnsweredDesignQuestions: state.hasDesignSection ? state.designQuestions!.filter { $0.isPassed }.count : 0,
                numberOfRequirementQuestions: state.requirementsQuestions.count,
                numberOfRightlyAnsweredRequirementQuestions: state.requirementsQuestions.filter { $0.isPassed }.count,
                numberOfCodeStructureQuestions: state.codeStructureQuestions.count,
                numberOfRightlyAnsweredCodeStructureQuestions: state.codeStructureQuestions.filter { $0.isPassed }.count,
                numberOfCleanCodeQuestions: state.cleanCodeQuestions.count,
                numberOfRightlyAnsweredCleanCodeQuestions: state.cleanCodeQuestions.filter { $0.isPassed }.count)
            destination.firstName = firstName ?? ""
            destination.lastName = lastName ?? ""
            destination.modulChused = modulChused
        }
    }
}

// MARK: data source

extension RateModuleViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return state.hasDesignSection ? 4 : 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return state.hasDesignSection ? state.designQuestions!.count : state.requirementsQuestions.count
        case 1:
            return state.hasDesignSection ? state.requirementsQuestions.count : state.codeStructureQuestions.count
        case 2:
            return state.hasDesignSection ? state.codeStructureQuestions.count : state.cleanCodeQuestions.count
        case 3:
            return state.hasDesignSection ? state.cleanCodeQuestions.count : 0
        default:
            fatalError("Unexpected section")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        cell.delegate = self
        
        var question: Question?
        
        switch section {
        case 0:
            if state.hasDesignSection {
                question = state.designQuestions![indexPath.row]
                // MARK: - PREGUNTA 2
                question?.titleNumber = "(\(String(indexPath.row + 1)) / \(state.designQuestions?.count ?? 0))"
                
            } else {
                question = state.requirementsQuestions[indexPath.row]
            }
        case 1:
            if state.hasDesignSection {
                question = state.requirementsQuestions[indexPath.row]
                question?.titleNumber = "(\(String(indexPath.row + 1)) / \(state.requirementsQuestions.count))"
            } else {
                question = state.codeStructureQuestions[indexPath.row]
            }
        case 2:
            if state.hasDesignSection {
                question = state.codeStructureQuestions[indexPath.row]
                question?.titleNumber = "(\(String(indexPath.row + 1)) / \(state.codeStructureQuestions.count))"
            } else {
                question = state.cleanCodeQuestions[indexPath.row]
            }
        case 3:
            if state.hasDesignSection {
                question = state.cleanCodeQuestions[indexPath.row]
                question?.titleNumber = "(\(String(indexPath.row + 1)) / \(state.cleanCodeQuestions.count))"
            } else {
                question = nil
            }
        default:
            question = nil
        }
        
        if let question = question {
            cell.configure(with: question)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "RateModuleSectionHeader")!
        
        switch section {
        case 0:
            header.textLabel?.text = state.hasDesignSection ? "Diseño(\(state.designQuestions?.count ?? 0))" : "Requisitos"
        case 1:
            header.textLabel?.text = state.hasDesignSection ? "Requisitos(\(state.requirementsQuestions.count))" : "Estructura de código"
        case 2:
            header.textLabel?.text = state.hasDesignSection ? "Estructura de código(\(state.codeStructureQuestions.count))": "Código limpio"
        case 3:
            header.textLabel?.text = state.hasDesignSection ? "Código limpio(\(state.cleanCodeQuestions.count))" : ""
        default:
            fatalError("Unexpected section")
        }
        return header
    }
}

extension RateModuleViewController: QuestionTableViewCellDelegate {
    func didToggleSwitch(for question: Question, value: Bool) {
        update(selectedQuestion: question, with: value)
        tableView.reloadData()
    }
}

