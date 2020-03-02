//
//  StudentList.swift
//  RateModules
//
//  Created by Mersad Meyfour on 02/03/2020.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import Foundation

struct StudentsList {
    var firstName: String
    var lastName: String
    var module: String
    var emoji: String
    var totalRatio: String
}

extension StudentsList: Codable {
    
    static let archiveURL =
        FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask).first!.appendingPathComponent("Documents")
            .appendingPathExtension("plist")
    
    static func saveToFile(rates: [StudentsList]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedRates = try? propertyListEncoder.encode(rates)
        
        try? encodedRates?.write(to: StudentsList.archiveURL, options: .noFileProtection)
        
    }
    
    static func loadFromFile() -> [StudentsList] {
        let propertyListDecoder = PropertyListDecoder()
        
        var finalRatesList: [StudentsList] = []
        
        if let retrievedRates = try? Data(contentsOf: StudentsList.archiveURL),
            let decodedRates = try? propertyListDecoder.decode(Array<StudentsList>.self, from: retrievedRates){
            
            finalRatesList.append(contentsOf: decodedRates.shuffled())
            
            return finalRatesList
        }
        return finalRatesList
    }
    
}
