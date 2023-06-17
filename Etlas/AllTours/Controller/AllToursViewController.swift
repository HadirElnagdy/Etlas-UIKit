//
//  AllToursViewController.swift
//  Etlas
//
//  Created by Hadir on 15/06/2023.
//

import UIKit

class AllToursViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var toursTableView: UITableView!
    
    var tourModels: [AllToursUIModel] = [AllToursUIModel()]
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        
    }
    
    private func setupTableView() {
        toursTableView.delegate = self
        toursTableView.dataSource = self
        toursTableView.register(UINib(nibName: String(describing: ToursTableViewCell.self), bundle: nil), forCellReuseIdentifier: "ToursTableViewCell")
    }
    
}
extension AllToursViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourModels.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toursTableView.dequeueReusableCell(withIdentifier: "ToursTableViewCell") as? ToursTableViewCell
        cell?.configure(model: tourModels[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell action
    }
    
}
