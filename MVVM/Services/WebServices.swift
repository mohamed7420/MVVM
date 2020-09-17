//
//  WebServices.swift
//  MVVM
//
//  Created by Mohamed on 9/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import UIKit

class WebService{
    
    public static let shared = WebService()
    let session = URLSession.shared
    public init(){}
    
    func getArticles(from url: String , completion: @escaping (([Article]?)->())){
        
        session.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            if let error = error{
                
                print("error \(error.localizedDescription)")
                completion(nil)
                
            }else if let data = data{
                
                do {

                    let articleList = try? JSONDecoder().decode(Articles.self, from: data)
                    
                    if let articleList = articleList{
                        
                        completion(articleList.articles)
                        print(articleList.articles)
                    }
                    print(articleList?.articles)
                } catch let error {
                    
                    print("\(error.localizedDescription)")
                }
                
            }
            
            
        }.resume()
        
    }
}
