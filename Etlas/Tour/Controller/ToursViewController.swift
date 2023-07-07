//
//  ToursViewController.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class ToursViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgsCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tourTitleLabel: UILabel!
    @IBOutlet weak var rateView: RatingView!
    @IBOutlet weak var tourDescriptionLabel: UILabel!
    
    
    var tour: Tour?
    var testImgs = [UIImage(named: "img_ToursGiza"), UIImage(named: "img_ToursGiza"), UIImage(named: "img_ToursGiza"), UIImage(named: "img_ToursGiza"), UIImage(named: "img_ToursGiza")]
    var timer: Timer?
    var currentCellIndex = 0
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        pageControl.numberOfPages = testImgs.count
        let contentSize = pageControl.size(forNumberOfPages: pageControl.numberOfPages)
        let pageControlWidth = contentSize.width
        pageControl.frame.size = CGSize(width: pageControlWidth, height: pageControl.frame.height)
        guard let tour = tour else {
            return
        }
        
        // Configure UI elements with tour data
        tourTitleLabel.text = tour.title
        rateView.cosmosView.rating = tour.rating ?? 0
        tourDescriptionLabel.text = tour.description
        
        setupCollectionView()
        startTimer()
        
    }
    
    private func setupCollectionView() {
        imgsCollectionView.delegate = self
        imgsCollectionView.dataSource = self
        imgsCollectionView.layer.cornerRadius = 30
        imgsCollectionView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        imgsCollectionView.layer.masksToBounds = true
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc private func moveToNextIndex() {
        currentCellIndex += 1
        currentCellIndex %= testImgs.count
        imgsCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
}

extension ToursViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testImgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourImgsCollectionViewCell", for: indexPath) as! TourImgsCollectionViewCell
        cell.tourImageView.image = testImgs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
