//
//  TikkleListPageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class TikkleListPageViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var createTikkleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUI()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUI() {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold), // semibold 굵기 설정
            .foregroundColor: UIColor.black
        ]
        let attributedText = NSAttributedString(string: "+ 생성하기", attributes: attributes)
        createTikkleButton.setAttributedTitle(attributedText, for: .normal)
        
        mainLabel.text = "나의 Tikkle 모음"
        subLabel.text = "티끌 모아 태산 !"
        mainLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        subLabel.font = UIFont.systemFont(ofSize: 15, weight: .black)
        subLabel.textColor = UIColor.subTitleColor
        
        createTikkleButton.backgroundColor = UIColor.mainColor
        createTikkleButton.layer.cornerRadius = 17
        
        
        
        
    }
}







extension TikkleListPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TikkleListPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TikkleListTableViewCell
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // 행간 설정
        
        
        let titleText = beer.title
//        let attributedTitleText = NSAttributedString(
//            string: titleText,
//            attributes: [
//                .font: UIFont.systemFont(ofSize: 20, weight: .regular),
//                .paragraphStyle: paragraphStyle // paragraphStyle 추가
//            ]
//        )
//
//        cell.titleLabel.lineBreakMode = .byWordWrapping

        
//        cell.titleLabel.attributedText = attributedTitleText
        
        cell.titleLabel.font = .systemFont(ofSize: 24)
        cell.titleLabel.text = beer.title
        cell.tikkleImage.image = beer.image
        cell.tikkleImage.contentMode = .scaleAspectFill
        cell.graphImage.image = UIImage(named: "4")
        cell.percentLabel.text = "40%"
        
        
        
        
        return cell
    }
    
}
