//
//  Weather.swift
//  MVVM
//
//  Created by Mohamed on 9/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

struct Article: Decodable{
    
    let title: String
    let description: String
    
}


struct Articles: Decodable {
    
    let articles: [Article]
}
