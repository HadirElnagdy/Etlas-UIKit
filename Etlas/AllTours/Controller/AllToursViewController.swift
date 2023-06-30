//
//  AllToursViewController.swift
//  Etlas
//
//  Created by Hadir on 15/06/2023.
//

import UIKit

class AllToursViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var toursTableView: UITableView!
    
    var tourModels: [AllToursUIModel] = [AllToursUIModel(), AllToursUIModel(), AllToursUIModel()]
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "MainMenuViewController")
        self.present(VC, animated: true)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func filterPressed(_ sender: UIButton) {
        
    }
    
    // MARK: - Private methods
    private func setupUI() {
        setupTableView()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToursTableViewCell") as? ToursTableViewCell
        cell?.configure(model: tourModels[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // push the tour with the same id
    }
}
