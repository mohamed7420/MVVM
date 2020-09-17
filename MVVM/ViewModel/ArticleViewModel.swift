//
//  ArticleViewModel.swift
//  MVVM
//
//  Created by Mohamed on 9/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

struct ArticleListViewModel{
    
    let articles: [Article]
}
extension ArticleListViewModel{
    
    var numberOfSection: Int{
        
        return 1
    }
    
    func numberOfRow()->Int{
        
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int)-> ArticleViewModel{
        
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel{
    
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}
extension ArticleViewModel{
    
    var title: String{
        return self.article.title
    }
    
    var description: String{
        return self.article.description
    }
}
