//
//  Stamp.swift
//  T!kkle
//
//  Created by 김도현 on 2023/08/14.
//

import Foundation
import UIKit

class Stamp {
    var title: String
    var image: UIImage?
    var isCompletion: Bool
    
    init(title: String, image: UIImage? = nil, isCompletion: Bool) {
        self.title = title
        self.image = image
        self.isCompletion = isCompletion
    }
}
