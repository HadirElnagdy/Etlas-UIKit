//
//  AllArticlesViewController.swift
//  Etlas
//
//  Created by Hadir on 15/06/2023.
//

import UIKit

class AllArticlesViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: CustomTextField!
    
    
    var articleModels: [AllArticlesModel] = [AllArticlesModel(), AllArticlesModel(), AllArticlesModel(), AllArticlesModel(), AllArticlesModel(), AllArticlesModel(), AllArticlesModel()]
    
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
        setupCollectionViews()
    }
    
    private func setupCollectionViews() {
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        articlesCollectionView.register(UINib(nibName: "AllArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllArticlesCollectionViewCell")
    }
}

extension AllArticlesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllArticlesCollectionViewCell", for: indexPath) as? AllArticlesCollectionViewCell
        cell?.configure(model: articleModels[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //action
    }
}
