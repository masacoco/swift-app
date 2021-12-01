//
//  ContentView.swift
//  swift-app
//
//  Created by Masao Nakama on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var okashiDataList = OkashiData()
    @State var inputText = ""
    
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                    .onSubmit {
                        Task{
                            await okashiDataList.searchOkashi(keyword: inputText)
                        }
                    }
                    .submitLabel(.search)
                    .padding()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
