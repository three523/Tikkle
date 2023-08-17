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
        return st
    }()
    let otherTikkleTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "티끌 둘러보기"
        lb.font = .systemFont(ofSize: 25, weight: .semibold)
        lb.textColor = .white
        return lb
    }()
    let otherSubTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "다른 분들의 도전을 둘러보세요"
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        lb.textColor = UIColor(hexCode: "D9D9D9")
        return lb
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
