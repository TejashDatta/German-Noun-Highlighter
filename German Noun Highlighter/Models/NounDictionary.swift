//
//  Dictionary.swift
//  German Noun Highlighter
//
//  Created by Tejash Datta on 25/01/24.
//

import Foundation

final class NounDictionary {
    static let shared = NounDictionary()
    
    private let nounListFilename = "german_noun_list"
    
    private var nouns: [String: NounGender] = [:]
    
    init() {
        prepareDictionary()
    }
    
    private func prepareDictionary() {
        guard let nounListFilePath = Bundle.main.path(forResource: nounListFilename, ofType: "csv") else {
            return
        }
        
        var data = ""
        do {
            data = try String(contentsOfFile: nounListFilePath)
        } catch {
            print(error)
            return
        }
        
        let rows = data.components(separatedBy: "\r\n")
                        
        for row in rows {
            if row.isEmpty { continue }
            
            let columns = row.components(separatedBy: ";")
            nouns[columns[0].lowercased()] = NounGender(rawValue: columns[1])
        }
    }
    
    func lookUpGender(ofNoun noun: String) -> NounGender {
        if noun.first?.isUppercaseGerman() != true { return NounGender.notNoun }
        
        if let gender = nouns[noun.lowercased()] {
            return gender
        }
        
        var wordSuffix = ""
        for char in noun.reversed() {
            wordSuffix = String(char) + wordSuffix
            if let gender = nouns[wordSuffix] {
                return gender
            }
        }
        
        return NounGender.notNoun
    }
}
