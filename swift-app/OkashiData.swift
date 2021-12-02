//
//  OkashiData.swift
//  swift-app
//
//  Created by Masao Nakama on 12/1/21.
//

import Foundation
import UIKit

struct OkashiItem: Identifiable {
    let id = UUID()
    let name: String
    let comment: String
    let link: URL
    let image: URL
}

//お菓子検索用クラス
class OkashiData: ObservableObject{
    
    struct ResultJson: Codable {
        struct Item: Codable {
                let name: String?
                let comment: String?
                let url: URL?
                let image: URL?
            }
            let item: [Item]?
        }
        
        @Published var okashiList: [OkashiItem] = []
        
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
            
            do{
                let (data, _) = try await URLSession.shared.data(from: req_url)
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from:data)
                
    //                print(json)
                guard let items = json.item else {return}
                DispatchQueue.main.async {
                    self.okashiList.removeAll()
                }
                
                for item in items {
                    if let name = item.name,
                       let comment = item.comment,
                       let link = item.url,
                       let image = item.image{
                        let okashi = OkashiItem(name: name, comment: comment, link: link, image: image)
                        DispatchQueue.main.async{
                            self.okashiList.append(okashi)
                        }
                    }
                }
                print(self.okashiList)
            } catch {
                print("エラーが出ました")
            }
    }
}



