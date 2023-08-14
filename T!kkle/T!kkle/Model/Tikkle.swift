//
//  Tikkle.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import Foundation
import UIKit

class Tikkle {
    var image: UIImage?
    var title: String
    var description: String
    var stampList: [Stamp]
    
    init(image: UIImage? = nil, title: String, description: String, stampList: [Stamp]) {
        self.image = image
        self.title = title
        self.description = description
        self.stampList = stampList
    }
}
