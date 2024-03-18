//
//  ContentView.swift
//  WaCC
//
//  Created by Andreas Blechschmidt on 18.03.24.
//

//
//  CharCounter.swift
//  iOS_TA_CoreDataEinstieg
//
//  Created by Andreas Blechschmidt on 18.03.24.
//

import SwiftUI

struct CounterContentView: View {
    
    @State var inputText: String
    
    var body: some View {
        let text = inputText
        
        return VStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    TextEditor(text: $inputText)
                        .font(.title3)
                        .italic()
                        .cornerRadius(8)
                        .padding()
                        .lineLimit(8)
                        .frame(height: 100)
                    
                        Text("eingegebener Text:")
                            .frame(alignment: .leading)
                        
                        Text(text)
                            .frame(alignment: .leading)
                            .font(.title2)
                }
                .multilineTextAlignment(.leading)
                .padding()
//                .frame(width: .infinity)
                .scrollIndicators(.hidden)
            }
            
            
            HStack(alignment: .bottom) {
                Text("\nAnzahl der Zeichen:\t")
                    .bold()
                Text("\(counterOfChars())")
            }
            .frame(alignment: .leading)
            
            HStack(alignment: .bottom) {
                let wordCount = countWords(in: text)
                Text("Anzahl der Wörter:\t")
                    .bold()
                Text("\(wordCount)")
            }
            .frame(alignment: .leading)
            Spacer()
        }
    }
    
    func counterOfChars() -> Int {
        return inputText.count
    }
    
    
    func countWords(in text: String) -> Int {
        let words = text.components(separatedBy: .whitespacesAndNewlines)
        return words.filter { !$0.isEmpty }.count
    }
}


#Preview {
    CounterContentView(inputText: "")
}
