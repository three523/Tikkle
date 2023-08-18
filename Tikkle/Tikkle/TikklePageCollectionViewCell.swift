//
//  TikklePageCollectionViewCell.swift
//  Tikkle
//
//  Created by 김지훈 on 2023/08/15.
//

import UIKit

class TikklePageCollectionViewCell: UICollectionViewCell {
    
    var tikkle: Tikkle?
    
    //MARK: - 티클 버튼 초기값은 off
    var isOn: Bool = false
    
    @IBOutlet weak var TikklePageCellBtnImg: UIButton!
    @IBOutlet weak var TikklePageCellName: UILabel!
    
//MARK: - TikklePage CollectionView Cell Btn 클릭 시 혹시나?
    @IBAction func TikklePageCellBtnClicked(_ sender: Any) {
        
        //MARK: - 티클에 true가
        isOn = !isOn
        
        //MARK: - 티클이 눌러져서 true가 되면, 한번 더 눌러져서 false가되면
        if isOn == true {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleON.png"), for: .normal)
        } else {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleOFF.png"), for: .normal)
        }
    }
}

//버튼 눌렀을때 stampList.isCompletion 값 변경 - 버튼 눌릴떄가 아니라 isCompletion 상태값으로 체크해야 저장되려나???
//TikklePage CollectionView 스크롤하면 클릭했던거 돌아감
//push는 다 했음, TikkleListPage, FeedPage 코드 수정한거 조금 있음 = 머지할때 얘기할것
