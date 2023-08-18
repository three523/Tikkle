//
//  DummyData.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit


struct DataList {
    
    //티끌 더미데이터
    static var list: [Tikkle] = [beer, tripInKoreaTikkle, climbingTikkle, tripOverseasTikkle]
    
}


let beer: Tikkle = Tikkle(image: UIImage(named: "beer"), title: "편의점 해외맥주 도장깨기", description: "편의점의 해외 맥주를 마셔보아요!", isPrivate: true, isSharedProject: true, stampList:  [
    Stamp(title: "하이네켄", isCompletion: true),
    Stamp(title: "버드와이저", isCompletion: true),
    Stamp(title: "호가든로제", isCompletion: true),
    Stamp(title: "써머스비", isCompletion: false),
    Stamp(title: "칭타오", isCompletion: false),
    Stamp(title: "삿포로", isCompletion: false),
    Stamp(title: "아사히", isCompletion: false),
    Stamp(title: "블랑로제", isCompletion: false),
    Stamp(title: "스텔라", isCompletion: false),
    Stamp(title: "칼스버그", isCompletion: false),
    Stamp(title: "블루문", isCompletion: false),
    Stamp(title: "구스아일랜드", isCompletion: false),
    Stamp(title: "블랑", isCompletion: false),
])


let tripInKoreaTikkle: Tikkle = Tikkle(image: UIImage(named: "travel"), title: "꼭 가봐야 할 국내여행지", description: "국내 여행지를 돌아다녀 보아요!", isPrivate: false, isSharedProject: false, stampList: [
    Stamp(title: "제주도", isCompletion: true),
    Stamp(title: "강릉", isCompletion: true),
    Stamp(title: "서울", isCompletion: true),
    Stamp(title: "부산", isCompletion: true),
    Stamp(title: "대전", isCompletion: true),
    Stamp(title: "속초", isCompletion: true),
    Stamp(title: "양평", isCompletion: true),
    Stamp(title: "춘천", isCompletion: true),
    Stamp(title: "영월", isCompletion: true),
    Stamp(title: "여수", isCompletion: true),
    Stamp(title: "서산", isCompletion: true),
    Stamp(title: "광주", isCompletion: true),
])


let climbingTikkle = Tikkle(image: UIImage(named: "mountain"), title: "우리나라 등산코스 30곳 가보기", description: "국내에 여러 산들을 등산해보아요!", isPrivate: false, isSharedProject: false, stampList: [
    Stamp(title: "지리산", isCompletion: true),
    Stamp(title: "금강산", isCompletion: false),
    Stamp(title: "계방산", isCompletion: false),
    Stamp(title: "오대산", isCompletion: false),
    Stamp(title: "덕유산", isCompletion: false),
    Stamp(title: "한라산", isCompletion: false),
    Stamp(title: "운악산", isCompletion: false),
    Stamp(title: "삼악산", isCompletion: false),
    Stamp(title: "백암산", isCompletion: false),
    Stamp(title: "아차산", isCompletion: false),
    Stamp(title: "운문산", isCompletion: false),
    Stamp(title: "소백산", isCompletion: false),
    Stamp(title: "내장산", isCompletion: false),
    Stamp(title: "천마산", isCompletion: false),
    Stamp(title: "설악산", isCompletion: false),
    Stamp(title: "화악산", isCompletion: false),
])


let tripOverseasTikkle: Tikkle = Tikkle(image: UIImage(named: "plane"), title: "해외여행지 도장깨기", description: "해외 여행지를 돌아다녀 보아요!", isPrivate: false, isSharedProject: false, stampList: [
    Stamp(title: "일본", isCompletion: true),
    Stamp(title: "중국", isCompletion: true),
    Stamp(title: "미국", isCompletion: true),
    Stamp(title: "캐나다", isCompletion: true),
    Stamp(title: "태국", isCompletion: false),
    Stamp(title: "말레이시아", isCompletion: false),
    Stamp(title: "필리핀", isCompletion: false),
    Stamp(title: "싱가포르", isCompletion: false),
    Stamp(title: "태국", isCompletion: false),
    Stamp(title: "호주", isCompletion: false),
    Stamp(title: "인도", isCompletion: false),
    Stamp(title: "러시아", isCompletion: false),
    Stamp(title: "우크라이나", isCompletion: false),
    Stamp(title: "베트남", isCompletion: false),
    Stamp(title: "로마", isCompletion: false),
    Stamp(title: "프랑스", isCompletion: false),
    Stamp(title: "스위스", isCompletion: false),
    Stamp(title: "스웨덴", isCompletion: false),
    Stamp(title: "터키", isCompletion: false),
    Stamp(title: "뉴질랜드", isCompletion: false),
    Stamp(title: "이집트", isCompletion: false),
    Stamp(title: "인도네시아", isCompletion: false),
    Stamp(title: "브라질", isCompletion: false),
    Stamp(title: "체코", isCompletion: false),
    Stamp(title: "영국", isCompletion: false),
    Stamp(title: "잉글랜드", isCompletion: false),
    Stamp(title: "아르엔티나", isCompletion: false),
])
