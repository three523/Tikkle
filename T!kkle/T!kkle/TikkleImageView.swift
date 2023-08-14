//
//  TikkleImageView.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import UIKit

class TikkleImageView: UIImageView {
    let title: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.text = "테스트 텍스트"
        lb.textColor = .black
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
