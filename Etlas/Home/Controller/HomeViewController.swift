//
//  HomeViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var toursCollectionView: UICollectionView!
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: CustomTextField!
    
    // MARK: - Data
    var tourModels: [Tour] = []
    var articleModels: [ArticleResult] = []
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTours()
        fetchArticles()
        setupCollectionViews()
        setupSearchTextField()
    }
    
    // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "MainMenuViewController")
        self.present(VC, animated: true)
    }
    
    @IBAction func seeAllToursPressed(_ sender: UIButton) {
        pushStoryboardViewController(identifier: "AllToursViewController")
    }
    
    @IBAction func seeAllArticlesPressed(_ sender: UIButton) {
        pushStoryboardViewController(identifier: "AllArticlesViewController")
    }
    
    // MARK: - Private methods
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func fetchTours() {
        APIClient.getAllTours { [weak self] result in
            switch result {
            case .success(let toursResponse):
                if let tourModels = toursResponse.results {
                    self?.tourModels = tourModels
                    self?.toursCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching tours: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchArticles() {
        APIClient.getAllArticles { [weak self] result in
            switch result {
            case .success(let articlesResponse):
                if let articleModels = articlesResponse.results {
                    self?.articleModels = articleModels
                    self?.articlesCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching articles: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupCollectionViews() {
        toursCollectionView.delegate = self
        toursCollectionView.dataSource = self
        toursCollectionView.register(UINib(nibName: "AllToursCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllToursCollectionViewCell")
        
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        articlesCollectionView.register(UINib(nibName: "AllArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllArticlesCollectionViewCell")
    }
    
    private func pushStoryboardViewController(identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupSearchTextField() {
        searchTextField.delegate = self
        searchTextField.returnKeyType = .search
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == toursCollectionView ? tourModels.count : articleModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == toursCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllToursCollectionViewCell", for: indexPath) as! AllToursCollectionViewCell
            let tour = tourModels[indexPath.item]
            cell.configure(model: tour)
            return cell
        } else if collectionView == articlesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllArticlesCollectionViewCell", for: indexPath) as! AllArticlesCollectionViewCell
            let article = articleModels[indexPath.item]
            cell.configure(model: article)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

