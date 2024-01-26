//
//  String+Ext.swift
//  German Noun Highlighter
//
//  Created by Tejash Datta on 25/01/24.
//

import Foundation
import RegexBuilder

extension String {
    func splitWithSeparatorsIncluded() -> [String] {
        var currentWord = ""
        var result: [String] = []
        
        for char in self {
            if char.isWhitespace || char.isNewline || char.isPunctuation {
                if !currentWord.isEmpty { 
                    result.append(currentWord)
                    currentWord = ""
                }
                result.append(String(char))
            } else {
                currentWord += String(char)
            }
        }
        if !currentWord.isEmpty { result.append(currentWord) }
        
        return result
    }
}

extension String.Element {
    func isUppercaseGerman() -> Bool {
        let uppercaseRegex = Regex {
            CharacterClass(
                .anyOf("ÄÖÜ"),
                ("A"..."Z")
            )
        }
        return String(self).wholeMatch(of: uppercaseRegex) != nil
    }
}
