//
//  Tikkle.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//
import Foundation
import UIKit

class Tikkle {
    var image: UIImage?
    var title: String
    var description: String
    var isPrivate: Bool
    var isSharedProject: Bool
    var stampList: [Stamp]
    
    
    init(image: UIImage? = nil, title: String, description: String, isPrivate: Bool, isSharedProject: Bool, stampList: [Stamp]) {
        self.image = image
        self.title = title
        self.description = description
        self.stampList = stampList
        self.isPrivate = isPrivate
        self.isSharedProject = isSharedProject
    }
}
