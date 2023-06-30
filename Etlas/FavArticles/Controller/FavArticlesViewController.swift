//
//  FavArticlesViewController.swift
//  Etlas
//
//  Created by Hadir on 19/06/2023.
//

import UIKit
//import SDWebImage

class FavArticlesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var favArticlesTableView: UITableView!
    
    var favArticleModel: [FavArticleModel] = [FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel()]
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        setupTableView()
        
    }
    
    private func setupTableView() {
        favArticlesTableView.delegate = self
        favArticlesTableView.dataSource = self
        favArticlesTableView.register(UINib(nibName: String(describing: FavArticlesTableViewCell.self), bundle: nil), forCellReuseIdentifier: "FavArticlesTableViewCell")
    }
    
}
extension FavArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArticleModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favArticlesTableView.dequeueReusableCell(withIdentifier: "FavArticlesTableViewCell") as? FavArticlesTableViewCell
        cell?.configure(model: favArticleModel[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell action
    }
    
}
