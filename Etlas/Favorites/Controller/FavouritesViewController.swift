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
    
    
    var favsModel: [FavoritesResult] = []
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getFavorites { [weak self] result in
            switch result {
            case .success(let response):
                self?.favsModel = response.results ?? []
                self?.modelsTableView.reloadData()
                self?.articlesTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
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
            return favsModel.filter { $0.monument != nil}.count
        } else if tableView == articlesTableView {
            return favsModel.filter { $0.article != nil }.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == modelsTableView {
            let cell = modelsTableView.dequeueReusableCell(withIdentifier: "FavModelsTableViewCell") as! FavModelsTableViewCell
            let model = favsModel[indexPath.row]
            cell.configure(model: model)
            return cell
        } else if tableView == articlesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavArticlesTableViewCell", for: indexPath) as! FavArticlesTableViewCell
                  let model = favsModel[indexPath.row]
                  cell.configure(model: model)
                  return cell
        } else {
            return UITableViewCell()
        }
    }
}
