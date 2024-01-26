//
//  ContentView.swift
//  German Noun Highlighter
//
//  Created by Tejash Datta on 24/01/24.
//

import SwiftUI

struct TextEntryView: View {
    private let textBoxInset = 15.0
    
    @State private var inputText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                    
                    TextEditor(text: $inputText)
                        .autocorrectionDisabled()
                        .padding(EdgeInsets(top: textBoxInset, leading: textBoxInset, bottom: textBoxInset, trailing: textBoxInset))
                    
                    if inputText.isEmpty {
                        Text("Type or paste German text here")
                            .opacity(0.4)
                            .padding(22)
                            .allowsHitTesting(false)
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button {
                        inputText = ""
                    } label: {
                        Text("Clear Text")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    .controlSize(.large)
                    .disabled(inputText.isEmpty)
                    
                    NavigationLink(value: inputText) {
                        Text("Highlight Nouns")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .controlSize(.large)
                    .disabled(inputText.isEmpty)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal)
            .navigationTitle("Enter Text")
            .navigationDestination(for: String.self) { inputText in
                ResultTextView(inputText: inputText)
            }
        }
    }
}

#Preview {
    TextEntryView()
}
