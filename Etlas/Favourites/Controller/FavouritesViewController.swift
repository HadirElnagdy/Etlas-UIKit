//
//  FavouritesViewController.swift
//  Etlas
//
//  Created by Hadir on 21/06/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var modelsTableView: UITableView!
    @IBOutlet weak var articlesTableView: UITableView!
    
    var favArticleModel: [FavArticleModel] = [FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel(), FavArticleModel()]
    var favModelModel: [FavModelModel] = [FavModelModel(), FavModelModel(), FavModelModel(), FavModelModel(), FavModelModel()]
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func seeAllModelsPressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "FavModelsViewController")
    }
    
    @IBAction func seeAllArticlesPressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "FavArticlesViewController")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        articlesTableView.register(UINib(nibName: String(describing: FavArticlesTableViewCell.self), bundle: nil), forCellReuseIdentifier: "FavArticlesTableViewCell")
        
        modelsTableView.delegate = self
        modelsTableView.dataSource = self
        modelsTableView.register(UINib(nibName: String(describing: FavModelsTableViewCell.self), bundle: nil), forCellReuseIdentifier: "FavModelsTableViewCell")
    }
    
    private func pushViewController(withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == modelsTableView {
            return favModelModel.count
        } else if tableView == articlesTableView {
            return favArticleModel.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == modelsTableView {
            let cell = modelsTableView.dequeueReusableCell(withIdentifier: "FavModelsTableViewCell") as? FavModelsTableViewCell
            cell?.configure(model: favModelModel[indexPath.row])
            return cell ?? UITableViewCell()
        } else if tableView == articlesTableView {
            let cell = articlesTableView.dequeueReusableCell(withIdentifier: "FavArticlesTableViewCell") as? FavArticlesTableViewCell
            cell?.configure(model: favArticleModel[indexPath.row])
            return cell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}
