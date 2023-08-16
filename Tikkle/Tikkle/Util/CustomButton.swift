//
//  CustomButton.swift
//  Tikkle
//
//  Created by FUTURE on 2023/08/16.
//


import UIKit

class CustomButton: UIButton {
    
    static func makeButton(title: String, color: UIColor) -> UIButton {
        let button = CustomButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        
        // 버튼의 텍스트 설정
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        // 버튼의 색상 설정
        button.backgroundColor = color
        
        //버튼의 둥글기
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        return button
    }
    
    static func makePrivateTrueButton() -> UIButton {
        return makeButton(title: "공개", color: UIColor.green)
    }
    
    static func makePrivateFalseButton() -> UIButton {
        return makeButton(title: "비공개", color: UIColor.gray)
    }
    
    static func makeTogetherButton() -> UIButton {
        return makeButton(title: "함께", color: UIColor.green)
    }
    
    static func makeEditButton() -> UIButton {
        return makeButton(title: "편집", color: UIColor.green)
    }
}
