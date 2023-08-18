//
//  Tikkle.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//
import Foundation
import UIKit

class Tikkle {
    let id: UUID = UUID() //id는 바뀌면 안되니 let
    var image: UIImage?
    var title: String
    var description: String
    var isPrivate: Bool
    var isSharedProject: Bool
    var stampList: [Stamp]
    var createDate: Date = Date()
    //hoonMARK: - 
    var tikkleCompleted: Bool
    
    init(image: UIImage? = nil, title: String, description: String, isPrivate: Bool, isSharedProject: Bool, stampList: [Stamp], tikkleCompleted: Bool) {
        self.image = image
        self.title = title
        self.description = description
        self.stampList = stampList
        self.isPrivate = isPrivate
        self.isSharedProject = isSharedProject
        self.tikkleCompleted = tikkleCompleted
    }
}
