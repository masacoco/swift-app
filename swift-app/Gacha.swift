//
//  Gacha.swift
//  swift-app
//
//  Created by Masao Nakama on 12/7/21.
//

import SwiftUI

struct Gacha: View {
    
    @State var answerNumber = 0
    
    var body: some View {
        
        VStack {
            Text("今日のラッキー菓子は...")
            
            if answerNumber == 0 {
                Image("uranai")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("今日はなにを食べよう")

            }else if answerNumber == 1 {
                Image("cake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ケーキ")
            } else if answerNumber == 2 {
                Image("biscuit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ビスケット")
            } else if answerNumber == 3{
                Image("candy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("キャンディー")
            } else if answerNumber == 4{
                Image("chocolate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("チョコレート")
            } else if answerNumber == 5 {
                Image("fruits")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ドライフルーツ")
            } else if answerNumber == 6 {
                Image("icecream")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("アイス")
            } else if answerNumber == 7 {
                Image("popcorn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ポップコーン")
            } else if answerNumber == 8 {
                Image("potatochips")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ポテトチップス")
            } else if answerNumber == 9{
                Image("snack")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ホットスナック")
            } else if answerNumber == 10 {
                Image("waffle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("ワッフル")
            } else {
                Image("wagashi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                Text("和菓子")
            }
            Spacer()
            Button(action:{
                answerNumber = Int.random(in: 1...11)
            }){
                Text("占う！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
        
        
    }
}

struct Gacha_Previews: PreviewProvider {
    static var previews: some View {
        Gacha()
    }
}
