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
        ZStack{
            Image("background").ignoresSafeArea()
            
        NavigationView{
        VStack {
            NavigationLink(destination: Gacha()){
                Text("今日のお菓子を占う")
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
            Text("お菓子大辞典")
                .font(.title)
                .multilineTextAlignment(.center)
              TextField("キーワード", text: $inputText, prompt: Text("今日はなにの気分？"))
                      .onSubmit {
                          Task{
                              await okashiDataList.searchOkashi(keyword: inputText)
                          }
                      }
                      .submitLabel(.search)
              
                List(okashiDataList.okashiList){ okashi in
                    VStack {
                        Text(okashi.name)
                            .font(.system(.title, design: .rounded))
                        
                          AsyncImage(url: okashi.image){ image in
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(height: 160)
                          } placeholder: {
                              ProgressView()
                          }
                        Text(okashi.comment.suffix(okashi.comment.count - 3).dropLast(5))
                    }

                    }
                }
            }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
