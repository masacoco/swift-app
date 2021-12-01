//
//  OkashiData.swift
//  swift-app
//
//  Created by Masao Nakama on 12/1/21.
//

import Foundation
//お菓子検索用クラス
class OkashiData: ObservableObject{
    func searchOkashi(keyword: String) async {
        print(keyword)
        
//        お菓子の検索URLエンコード
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

//        リクエストURL組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}



