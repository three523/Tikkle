//
//  CreateTikkle.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/18.
//

import UIKit

class StampButton: UIButton {
    
    private var tikkleTitleTextView: UITextView = {
        let tv = UITextView()
        tv.font = .systemFont(ofSize: 13, weight: .bold)
        tv.isUserInteractionEnabled = false
        tv.backgroundColor = .white
        tv.textAlignment = .center
        tv.textColor = .subTitleColor
        return tv
    }()
    var isEditeEnabled = false {
        didSet {
            tikkleTitleTextView.isUserInteractionEnabled = isEditeEnabled
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tikkleTitleTextView)
        uiSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func uiSetting() {
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        tikkleTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        tikkleTitleTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        tikkleTitleTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        tikkleTitleTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        tikkleTitleTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
    func stampTitle() -> String {
        return tikkleTitleTextView.text
    }
    
}
