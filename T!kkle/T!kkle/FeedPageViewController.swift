//
//  FeedViewController.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import UIKit

class FeedPageViewController: UIViewController {

    @IBOutlet weak var recommendCollectionView: UICollectionView!
    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        recommendCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)

        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }
}

extension FeedPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == recommendCollectionView ? 6 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommendCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell {
                cell.layer.borderWidth = 0.5
                cell.layer.borderColor = UIColor.black.cgColor
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell {
                cell.layer.borderWidth = 0.5
                cell.layer.borderColor = UIColor.black.cgColor
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == feedCollectionView {
            let width = collectionView.bounds.width - 80
            let height = collectionView.bounds.height - 50
            return CGSize(width: width, height: height)
        }
        let width = collectionView.bounds.width - 100
        return CGSize(width: width, height: 100.0)
    }
    
}
