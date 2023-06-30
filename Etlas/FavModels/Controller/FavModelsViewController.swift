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
        return favModelModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favModelsTableView.dequeueReusableCell(withIdentifier: "FavModelsTableViewCell") as? FavModelsTableViewCell
        cell?.configure(model: favModelModel[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell action
    }
    
}
