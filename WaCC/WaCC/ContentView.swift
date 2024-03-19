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
    
    //MARK: - var
    @State var inputText: String
    @State var inputChar: String
    var body: some View {
        let text = inputText
        let countE = inputChar
        return VStack {
            
            
            //MARK: - UI
            //            VStack {
            
            //MARK: - Eingabe
            VStack(alignment: .leading) {
                HStack {
                    Text("Text eingeben:")
                    Spacer(minLength: 342)
                    Text("Buchstabe: "); TextEditor(text: $inputChar)
                        .lineLimit(1)
                        .frame(width: 40, height: 24, alignment: .bottomLeading)
                        .cornerRadius(6)
//                        .padding()
                    Spacer()
                }
                TextEditor(text: $inputText)
                    .font(.title3)
                    .italic()
                    .cornerRadius(6)
                    .padding()
                    .lineLimit(8)
                    .frame(height: 144)
            }
            .padding()
            
            
            //MARK: - Ausgabe
            VStack {
                Text("eingegebener Text:")
                    .frame(alignment: .leading)
                
                if !text.isEmpty {
                    Text(text)
                        .padding(.horizontal, 8)
                        .frame(height: 288, alignment: .leading)
                        .font(.title2)
                        .background(Color.blue.opacity(0.6))
                        .foregroundStyle(.white)
                        .cornerRadius(4)
                } else {}
            }
            .multilineTextAlignment(.leading)
            
            Spacer()
            
            
            //MARK: - Ergebnis
            
            Divider()
                .background(Color.blue.opacity(0.4))
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
            
            HStack(alignment: .bottom) {
                let countE = countletterE(in: text)
                Text("Anzahl Buchstabe \(inputChar):\t")
                    .bold()
                Text("\(countE)")
            }
            .frame(alignment: .leading)
            
            
            Spacer()
            
        }
    }
    
    //MARK: - func
    func counterOfChars() -> Int {
        return inputText.count
    }
    
    
    func countWords(in text: String) -> Int {
        let words = text.components(separatedBy: .whitespacesAndNewlines)
        return words.filter { !$0.isEmpty }.count
    }
    
    
    func countletterE(in text: String) -> Int {
        let countE = text.filter { $0 == "E" || $0 == "e" }.count
        return countE
    }
}


#Preview {
    CounterContentView(inputText: "", inputChar: "")
}
