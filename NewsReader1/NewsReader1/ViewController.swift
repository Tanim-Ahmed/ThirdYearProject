//
//  ViewController.swift
//  NewsReader1
//
//  Created by cse on 11/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        self.performSegue(withIdentifier: "loginView", sender: self);
        
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    var articles: [Article]? = []
    var source = "techcrunch"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles(fromSource: source)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if(!isLoggedIn){
            self.performSegue(withIdentifier: "loginView", sender: self);
        }
        
    }
    
    func fetchArticles(fromSource provider: String){
        let preference = provider
        UserDefaults.standard.set(preference, forKey: "Preference")
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=\(preference)&sortBy=top&apiKey=f60c738cba84404c8f514cfbc54749a4")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String,let url = articleFromJson["url"] as? String,let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                            article.author = author
                            article.desc = desc
                            article.headline = title
                            article.url = url
                            article.imageUrl = urlToImage
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        cell.title.text = self.articles?[indexPath.item].headline
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.author.text = self.articles?[indexPath.item].author
        cell.imgview.downloadImage(from: (self.articles?[indexPath.item].imageUrl)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebviewViewController
        
        webVC.url = self.articles?[indexPath.item].url
        
        self.present(webVC, animated: true, completion: nil)
        
    }
    
    let menuManager = MenuManager()
    @IBAction func menuPressed(_ sender: Any) {
        
        menuManager.openMenu()
        menuManager.mainVC = self
    }
    
    
}

extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

