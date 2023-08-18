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
    
    //MARK: -
    func cellUISetting(tikkle: Tikkle?, index: Int) {
        self.tikkle = tikkle
        self.index = index
        
        if tikkle?.stampList[index].isCompletion == true {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleON.png"), for: .normal)
        } else {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleOFF.png"), for: .normal)
        }
    }
    
//MARK: - TikklePage CollectionView Cell Btn 클릭 시 혹시나?
    @IBAction func TikklePageCellBtnClicked(_ sender: Any) {
        
        //MARK: -
        guard let index,
        let tikkle else { return }
        
        tikkle.stampList[index].isCompletion = !tikkle.stampList[index].isCompletion
        
        if tikkle.stampList[index].isCompletion == true {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleON.png"), for: .normal)
        } else {
            TikklePageCellBtnImg.setImage(UIImage(named: "TikkleOFF.png"), for: .normal)
        }
        tikkleList.updateTikkleInfo(index: index, tikkle)

    }
    
}
