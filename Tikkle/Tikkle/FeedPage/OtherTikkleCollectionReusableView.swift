//
//  OutherTikkleCollectionReusableView.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/16.
//

import UIKit

class OtherTikkleCollectionReusableView: UICollectionReusableView {
    static let identifier: String = "\(OtherTikkleCollectionReusableView.self)"
    
    lazy var otherStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [otherTikkleTitleLabel, otherSubTitleLabel])
        st.axis = .vertical
        st.alignment = .leading
        st.distribution = .fillProportionally
        st.spacing = -16
        return st
    }()
    let otherTikkleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "티끌 둘러보기"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .white
        return label
    }()
    let otherSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 분들의 도전을 둘러보세요!"
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = UIColor.subTitleColor
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(otherStackView)
        
        otherStackView.translatesAutoresizingMaskIntoConstraints = false
        otherStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        otherStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        otherStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        otherStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
