//
//  FavModelsViewController.swift
//  Etlas
//
//  Created by Hadir on 21/06/2023.
//

import UIKit

class FavModelsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var favModelsTableView: UITableView!
    var favModelModel: [FavoritesResult] = []
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getFavorites { [weak self] result in
            switch result {
            case .success(let response):
                self?.favModelModel = response.results 
                self?.favModelsTableView.reloadData()
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
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        setupTableView()
        
    }
    
    private func setupTableView() {
        favModelsTableView.delegate = self
        favModelsTableView.dataSource = self
        favModelsTableView.register(UINib(nibName: String(describing: FavModelsTableViewCell.self), bundle: nil), forCellReuseIdentifier: "FavModelsTableViewCell")
    }
    
}
extension FavModelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favModelModel.filter { $0.monument != nil}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favModelsTableView.dequeueReusableCell(withIdentifier: "FavModelsTableViewCell") as? FavModelsTableViewCell
        cell?.configure(model: favModelModel[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = favModelModel[indexPath.item]
        let storyboard = UIStoryboard(name: "StatueViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "StatueViewController") as StatueViewController
        viewController.monument = model.monument
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
