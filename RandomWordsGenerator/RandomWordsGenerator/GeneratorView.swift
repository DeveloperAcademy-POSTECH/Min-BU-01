//
//  GeneratorView.swift
//  RandomWordsGenerator
//
//  Created by Keum MinSeok on 2022/06/27.
//

import SwiftUI

struct GeneratorView: View {
    @State private var numberOfWords = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Number of words", selection: $numberOfWords) {
                    ForEach(1..<16) {
                        if $0 > 1 {
                            Text("\($0) words")
                        } else {
                            Text("1 word")
                        }
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                NavigationLink {
                    WordList(numberOfWords: $numberOfWords)
                } label: {
                    Text("Generate")
                        .padding(.all)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("RandomWordsGenerator")
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()
    }
}
