//
//  TikklePageCollectionViewCell.swift
//  Tikkle
//
//  Created by 김지훈 on 2023/08/15.
//

import UIKit

class TikklePageCollectionViewCell: UICollectionViewCell {
    
    var tikkle: Tikkle?
    //MARK: -
    var index: Int?
    //MARK: -
    var tikkleList: TikkleListManager = TikkleListManager()
    
    @IBOutlet weak var TikklePageCellBtnImg: UIButton!
    @IBOutlet weak var TikklePageCellName: UILabel!
    
    //MARK: - TikklePage에 있는 Cell 하나하나의 값을 가져오는 tikkle 데이터와 index 순번으로 값을 알아내고 그 데이터대로 ON, OFF 이미지를 노출한다.
    func cellUISetting(tikkle: Tikkle?, index: Int) {
        self.tikkle = tikkle
        self.index = index
        
        if tikkle?.stampList[index].isCompletion == true {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleON.png"), for: .normal)
        } else {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleOFF.png"), for: .normal)
        }
    }
    
////MARK: - TikklePage CollectionView Cell Btn 클릭 시 혹시나?
//    @IBAction func TikklePageCellBtnClicked(_ sender: Any) {
//        
//        //MARK: - Tikkle 완료를 위해서 클릭 시 필요한 티클과 순번을 가져와서 눌렀을때마다 이미지와 isCompletion의 값을 변경해서 업데이트까지 하는 동작
//        guard let tikkle,
//        let index else { return }
//        
//        tikkle.stampList[index].isCompletion = !tikkle.stampList[index].isCompletion
//        
//        if tikkle.stampList[index].isCompletion == true {
//            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleON.png"), for: .normal)
//        } else {
//            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleOFF.png"), for: .normal)
//        }
//        tikkleList.updateTikkleInfo(index: index, tikkle)
//
//    }
    
}
