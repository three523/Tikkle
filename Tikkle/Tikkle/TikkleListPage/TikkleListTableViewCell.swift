//
//  TikkleListTableViewCell.swift
//  Tikkle
//
//  Created by FUTURE on 2023/08/16.
//

import UIKit

class TikkleListTableViewCell: UITableViewCell {
    
    //요소 아울렛
    @IBOutlet weak var tikkleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var graphImage: UIImageView!
    @IBOutlet weak var isPrivateButton: UIButton!
    @IBOutlet weak var isSharedProjectButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            }
}
