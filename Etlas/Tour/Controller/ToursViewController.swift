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
    
    //    @IBOutlet weak var pageControlView: CustomView!
    //    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tourTitleLabel: UILabel!
    @IBOutlet weak var rateView: RatingView!
    @IBOutlet weak var tourDescriptionLabel: UILabel!
    
    
    var tour: Tour?
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
        //        pageControl.numberOfPages = testImgs.count
        //        let contentSize = pageControl.size(forNumberOfPages: pageControl.numberOfPages)
        //        let pageControlWidth = contentSize.width
        //        pageControl.frame.size = CGSize(width: pageControlWidth, height: pageControl.frame.height)
        //
        guard let tour = tour else {
            return
        }
        // Configure UI elements with tour data
        tourTitleLabel.text = tour.title
        rateView.cosmosView.rating = tour.rating ?? 0
        let attributedDescription = NSMutableAttributedString()
        
        let titleFont = UIFont(name: "Montserrat-Bold", size: 18.0) ?? UIFont.boldSystemFont(ofSize: 18.0)
        let descriptionFont = UIFont(name: "Montserrat-Regular", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
        
        if let sections = tour.sections {
            for section in sections {
                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: titleFont,
                ]
                let titleString = NSAttributedString(string: section.title ?? "", attributes: titleAttributes)
                attributedDescription.append(titleString)
                
                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: descriptionFont,
                ]
                let descriptionString = NSAttributedString(string: "\n\(section.description ?? "")\n\n\n", attributes: descriptionAttributes)
                attributedDescription.append(descriptionString)
            }
        }
        
        tourDescriptionLabel.attributedText = attributedDescription
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
        currentCellIndex %= (tour?.images?.count ?? 1)
        imgsCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        //        pageControl.currentPage = currentCellIndex
    }
}

extension ToursViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tour?.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourImgsCollectionViewCell", for: indexPath) as! TourImgsCollectionViewCell
        
        if let tourImages = tour?.images {
            if let imageURLString = tourImages[indexPath.row].imageURL,
               let imageURL = URL(string: imageURLString) {
                URLSession.shared.dataTask(with: imageURL) { data, _, error in
                    if let error = error {
                        print("Error loading image: \(error)")
                    } else if let data = data {
                        DispatchQueue.main.async {
                            cell.tourImageView.image = UIImage(data: data)
                        }
                    }
                }.resume()
            } else {
                cell.tourImageView.image = UIImage(named: "photo")
            }
        } else {
            cell.tourImageView.image = UIImage(named: "photo")
        }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
