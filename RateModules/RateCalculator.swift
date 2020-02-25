//
//  RateCalculator.swift
//  RateModule1
//
//  Created by Adrian Tineo on 26.01.20.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import Foundation

struct RateCalculator {
    let numberOfDesignQuestions: Int
    let numberOfRightlyAnsweredDesignQuestions: Int
    let numberOfRequirementQuestions: Int
    let numberOfRightlyAnsweredRequirementQuestions: Int
    let numberOfCodeStructureQuestions: Int
    let numberOfRightlyAnsweredCodeStructureQuestions: Int
    let numberOfCleanCodeQuestions: Int
    let numberOfRightlyAnsweredCleanCodeQuestions: Int
   
    var ratioDesignQuestions: Double {
        return numberOfDesignQuestions > 0 ? Double(numberOfRightlyAnsweredDesignQuestions) / Double(numberOfDesignQuestions) : 1.0
    }
    
    var ratioRequirementQuestions: Double {
        return Double(numberOfRightlyAnsweredRequirementQuestions) / Double(numberOfRequirementQuestions)
    }
    
    var ratioCodeStructureQuestions: Double {
        return Double(numberOfRightlyAnsweredCodeStructureQuestions) / Double(numberOfCodeStructureQuestions)
    }
    
    var ratioCleanCodeQuestions: Double {
        return Double(numberOfRightlyAnsweredCleanCodeQuestions) / Double(numberOfCleanCodeQuestions)
    }
    
    var totalRatio: Double {
        return (ratioDesignQuestions + ratioRequirementQuestions + ratioCodeStructureQuestions + ratioCleanCodeQuestions) / 4.0
    }
    
    var hasPassed: Bool {
        return (ratioDesignQuestions + ratioRequirementQuestions)/2.0 >= 0.6 && totalRatio >= 0.6
    }
    
    var rateAsPercent: Double {
        return totalRatio * 100.0
    }

}

