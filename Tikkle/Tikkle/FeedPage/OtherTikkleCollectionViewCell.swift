//
//  AnotherTikkleCollectionViewCell.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/16.
//

import UIKit

class OtherTikkleCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "\(OtherTikkleCollectionViewCell.self)"
    lazy var userStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [userImageView, userNameLabel])
        st.axis = .horizontal
        st.alignment = .center
        st.distribution = .equalSpacing
        st.isLayoutMarginsRelativeArrangement = true
        st.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        st.backgroundColor = UIColor(hexCode: "08190A")
        return st
    }()
    let userImageView: UIImageView = UIImageView(image: UIImage(systemName: "person"))
    let userNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "test"
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        lb.textColor = .white
        return lb
    }()
    lazy var tikkleStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [kikkleTitleLabel, likeButton])
        st.axis = .horizontal
        st.alignment = .center
        st.distribution = .equalSpacing
        st.isLayoutMarginsRelativeArrangement = true
        st.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        st.backgroundColor = UIColor(hexCode: "D9D9D9").withAlphaComponent(0.6)
        return st
    }()
    let kikkleTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "매일 commit 하기"
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        lb.textColor = .white
        return lb
    }()
    let likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        btn.tintColor = .mainColor
        return btn
    }()
    
    let backgroundImageView = UIImageView(image: UIImage(systemName: "person"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(userStackView)
        contentView.addSubview(tikkleStackView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        userStackView.translatesAutoresizingMaskIntoConstraints = false
        userStackView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor).isActive = true
        userStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        userStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        userStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tikkleStackView.translatesAutoresizingMaskIntoConstraints = false
        tikkleStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        tikkleStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        tikkleStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        tikkleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
