//
//  TikklePageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class TikklePageViewController: UIViewController {
    
    @IBOutlet weak var TikklePageImage: UIImageView!
    @IBOutlet weak var TikklePageTitle: UILabel!
    @IBOutlet weak var TikklePageDaysLabel: UILabel!
    @IBOutlet weak var TikklePageDateLabel: UILabel!
    @IBOutlet weak var TikklePageInfo: UILabel!
    
    @IBOutlet weak var TikklePageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TikklePageCollectionView.delegate = self
        TikklePageCollectionView.dataSource = self
    }
}

//MARK: - TikklePage CollectionView Setting
extension TikklePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return menuimgArray.count
        return 14
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TikklePageCollectionView.dequeueReusableCell(withReuseIdentifier: "TikklePageCollectionViewCell", for: indexPath) as! TikklePageCollectionViewCell
        
        cell.TikklePageCellName.text = "일이삼사오"
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = TikklePageCollectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}
