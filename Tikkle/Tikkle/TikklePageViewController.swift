//
//  TikklePageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class TikklePageViewController: UIViewController {
    
    var tikkle: Tikkle?
    
    @IBOutlet weak var TikklePageImage: UIImageView!
    @IBOutlet weak var TikklePageTitle: UILabel!
    @IBOutlet weak var TikklePageDaysLabel: UILabel!
    @IBOutlet weak var TikklePageDateLabel: UILabel!
    @IBOutlet weak var TikklePageInfo: UILabel!
    
    @IBOutlet weak var TikklePageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTitle()
        uiSet()
        
        TikklePageCollectionView.delegate = self
        TikklePageCollectionView.dataSource = self
    }
    
    //MARK: - MyPage Titile 커스텀
    func viewTitle() {
        self.navigationItem.title = "티끌 모아보기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hexCode: "#52FF63")]
    }
    
    //MARK: - TikklePage Image, Title, Info 가져오기
    func uiSet() {
        guard let tikkle else { return }
        TikklePageImage.image = tikkle.image
        TikklePageImage.contentMode = .scaleToFill
        TikklePageImage.layer.cornerRadius = TikklePageImage.frame.height / 2
        TikklePageTitle.text = tikkle.title
        TikklePageInfo.text = tikkle.description
    }
}

//MARK: - TikklePage CollectionView Setting
extension TikklePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return menuimgArray.count
        return tikkle?.stampList.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TikklePageCollectionView.dequeueReusableCell(withReuseIdentifier: "TikklePageCollectionViewCell", for: indexPath) as! TikklePageCollectionViewCell
        
        cell.TikklePageCellName.text = tikkle?.stampList[indexPath.row].title
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = TikklePageCollectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}
