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
    
    var tourModels: [Tour] = []
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTours()
        setupTableView()
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
        // Set up UI elements
    }
    
    private func setupTableView() {
        toursTableView.delegate = self
        toursTableView.dataSource = self
        toursTableView.register(UINib(nibName: "ToursTableViewCell", bundle: nil), forCellReuseIdentifier: "ToursTableViewCell")
    }
    
    private func fetchTours() {
        APIClient.getAllTours { [weak self] result in
            switch result {
            case .success(let toursResponse):
                if let tourModels = toursResponse.results {
                    self?.tourModels = tourModels
                    self?.toursTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension AllToursViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToursTableViewCell", for: indexPath) as! ToursTableViewCell
        let tour = tourModels[indexPath.row]
        cell.configure(model: tour)
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTour = tourModels[indexPath.row]
        let storyboard = UIStoryboard(name: "ToursViewController", bundle: nil)
        let toursVC = storyboard.instantiateViewController(identifier: "ToursViewController") as! ToursViewController
        toursVC.tour = selectedTour
        navigationController?.pushViewController(toursVC, animated: true)
    }

}
