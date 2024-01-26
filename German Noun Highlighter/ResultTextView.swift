//
//  ResultTextView.swift
//  German Noun Highlighter
//
//  Created by Tejash Datta on 25/01/24.
//

import SwiftUI

struct ResultTextView: View {

    let inputText: String
    
    var resultText: AttributedString {
        var result = AttributedString("")
        
        for word in inputText.splitWithSeparatorsIncluded() {
            var wordAttributedString = AttributedString(word)
            
            wordAttributedString.foregroundColor = NounDictionary.shared.lookUpGender(ofNoun: word).highlightColor
            
            result += wordAttributedString
        }
        
        return result
    }
    
    var body: some View {

        // TODO: enable text selection
        
        
        ScrollView {
            ZStack {
//                TextEditor(text: .constant(inputText))
//                    .padding(.vertical, 9)
//                    .padding(.horizontal, 11)
//                    .foregroundColor(.clear)

                Text(resultText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(17)
//                    .allowsHitTesting(false)
            }
        }
        .navigationTitle("Nouns Highlighted")
    }
}

#Preview {
    NavigationStack {
        ResultTextView(inputText: SampleData.germanInputText)
    }
}
