//
//  NounGender.swift
//  German Noun Highlighter
//
//  Created by Tejash Datta on 25/01/24.
//

import SwiftUI

enum NounGender: String {
    case male = "M"
    case female = "F"
    case neuter = "N"
    case onlyPlural = "NG"
    case notDetermined = "ND"
    case notNoun
}

extension NounGender {
    var highlightColor: Color {
        switch(self) {
        case .male: .red
        case .female: .blue
        case .neuter: .green
        case .onlyPlural: .teal
        case .notDetermined: .gray
        case .notNoun: .primary
        }
    }
}
