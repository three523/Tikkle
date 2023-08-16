//
//  UIFont.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/16.
//

import Foundation
import UIKit

extension UIFont {
    static let display = systemFont(ofSize: 30, weight: .bold)
    static let diplay2 = systemFont(ofSize: 25, weight: .bold)
    static let display3Bold = systemFont(ofSize: 22, weight: .bold)
    static let display3Regular = systemFont(ofSize: 22, weight: .regular)
    
    static let body1SemiBold = systemFont(ofSize: 18, weight: .semibold)
    static let body1Regular = systemFont(ofSize: 18, weight: .regular)
    static let body2Bold = systemFont(ofSize: 14, weight: .bold)
    static let body2Medium = systemFont(ofSize: 14, weight: .medium)
    static let body3Medium = systemFont(ofSize: 13, weight: .medium)
}
