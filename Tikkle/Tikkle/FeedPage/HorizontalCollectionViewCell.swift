//
//  HorizontalCollectionViewCell.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/16.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "\(HorizontalCollectionViewCell.self)"
    let recommendCollectionView: UICollectionView = {
        let flow = CarouselLayout()
        flow.itemSize = CGSize(width: 280.0, height: 260.0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flow)
        cv.backgroundColor = .clear
        return cv
    }()
    let ints = [1,2,3,1,2,3,1,2,3]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(recommendCollectionView)
        
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        recommendCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        
        recommendCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recommendCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        recommendCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        recommendCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        recommendCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        recommendCollectionView.heightAnchor.constraint(equalToConstant: 258).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HorizontalCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.backgroundColor = .white
        print(ints[indexPath.item])
        return cell
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let endOffset = scrollView.contentSize.width - recommendCollectionView.frame.width
            
            if scrollView.contentOffset.x < .zero && velocity.x < .zero {
                print("처음 -> 마지막")
            } else if scrollView.contentOffset.x > endOffset && velocity.x > .zero  {
                print("마지막 -> 처음")
            }
    }
        
    //MARK: 무한 스크롤이 안됌
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let cgPoint = CGPoint(x: scrollView.contentOffset.x - recommendCollectionView.bounds.width/2, y: recommendCollectionView.bounds.height/2)
        guard let indexPath = recommendCollectionView.indexPathForItem(at: cgPoint) else { return }
        let item = indexPath.item
        print(item, ints.count)
        if item == ints.count - 3 {
            recommendCollectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredHorizontally, animated: false)
        } else if item == 1 {
            recommendCollectionView.scrollToItem(at: IndexPath(item: 4, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}
