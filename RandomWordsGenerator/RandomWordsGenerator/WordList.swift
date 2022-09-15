//
//  WordList.swift
//  RandomWordsGenerator
//
//  Created by Keum MinSeok on 2022/06/27.
//

import SwiftUI

struct WordList: View {
    @Binding var numberOfWords:Int
    @State var words = [String]()
    
    var body: some View {
        VStack{
            List(words, id:\.self) { randomWords in
                Text(randomWords)
            }
            .task{
                await wordData()
            }
        }
    }
    
    func wordData() async{
        guard let url = URL(string:"https://random-word-api.herokuapp.com/word?number=\(numberOfWords+1)") else {
            print("Invalid URL")
            return
        }
        
        do{
            let(data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([String].self, from: data){
                words = decodedResponse
            }
        } catch{
            print("Invalid URL")
        }
    }
    
    
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()
    }
}
