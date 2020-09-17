//
//  NewsListTableViewController.swift
//  MVVM
//
//  Created by Mohamed on 9/14/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    let webservice = WebService.shared
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }


    private func updateUI(){
        
        let urlString = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-08-16&sortBy=publishedAt&apiKey=740b8a24a9b74858aba803422adbb93c"
        
        webservice.getArticles(from: urlString) { articles in
            
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfRow()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableTableViewCell", for: indexPath) as? ArticleTableTableViewCell else {
            
            fatalError("ArticleCell identifier not found")
        }
        
        let article = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.labelTitle.text = article.title
        cell.labelDescription.text = article.description
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}
