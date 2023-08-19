//
//  DummyCreator.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import Foundation
class DummyDataCreator {
    // let str = "일본, 중국, 한국, 프랑스, 인도"
    // let tikkle = DummyDataCreator.createDummyData(tikkleTitle: "여행", description: "설명입니다", stampTitleStr: str)
    // 일본, 중국, 한국, 프랑스, 인도의 도장을 가진 Tikkle 객체 생성
    static func create(tikkleTitle: String, description: String, isPrivate: Bool, isSharedProject: Bool, stampTitleStr: String) -> Tikkle {
        let stampTitleList = stampTitleStr.replacingOccurrences(of: " ", with: "").split(separator: ",")
        var stampList = [Stamp]()
        for stampTitle in stampTitleList {
            stampList.append(Stamp(title: String(stampTitle), isCompletion: false))
        }
        
        //hoonMARK: - 
        return Tikkle(title: tikkleTitle, description: description, isPrivate: isPrivate, isSharedProject: isSharedProject, stampList: stampList)
    }
}
