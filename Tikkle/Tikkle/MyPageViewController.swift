//
//  MyPageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var myPageMyImg: UIImageView!
    @IBOutlet weak var myPageMyIDLabel: UILabel!
    @IBOutlet weak var myPageMyEditBtn: UIButton!
    
    @IBOutlet weak var ingTikkleView: UIView!
    @IBOutlet weak var ingTikkleCountLabel: UILabel!
    @IBOutlet weak var doneTikkleView: UIView!
    @IBOutlet weak var doneTikkleCountLabel: UILabel!
    
    @IBOutlet weak var MyPageTableView: UITableView!
    
    //MARK: - MyPage 더미데이터
    var count: [String] = ["2", "5"]
    let menuIcon: [UIImage] = [
        UIImage(named: "heart.png")!,
        UIImage(named: "vector.png")!,
        UIImage(named: "setting.png")!,
        UIImage(named: "contract.png")!,
        UIImage(named: "email.png")!
    ]
    var menu: [String] = ["내가 찜한 티끌판", "친구 초대", "앱 설정", "서비스 약관", "기능 추가 요청"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTitle()
        myInfo()
        countviewRadius()
        
        MyPageTableView.delegate = self
        MyPageTableView.dataSource = self
    }
    
    //MARK: - MyPage Titile 커스텀
    func viewTitle() {
        self.navigationItem.title = "마이페이지"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hexCode: "#52FF63")]
    }
    
    //MARK: - MyPage info 커스텀
    func myInfo() {
        myPageMyImg.image = UIImage(named: "TikkleOFF.png")
        myPageMyIDLabel.text = "루똘이"
    }
    
    //MARK: - MyPage count view 커스텀
    func countviewRadius() {
        ingTikkleView.layer.borderColor = UIColor.white.cgColor
        ingTikkleView.layer.borderWidth = 1.0
        ingTikkleView.layer.cornerRadius = 30
        ingTikkleView.layer.masksToBounds = true
        doneTikkleView.layer.borderColor = UIColor.white.cgColor
        doneTikkleView.layer.borderWidth = 1.0
        doneTikkleView.layer.cornerRadius = 30
        doneTikkleView.layer.masksToBounds = true
    }
    
}

//MARK: - MyPage TableView Setting
extension MyPageViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MypageTableViewCell", for: indexPath) as? MypageTableViewCell else {
            return UITableViewCell()
        }
        
        cell.mypageMenuImg.image = menuIcon[indexPath.row]
        cell.mypageMenuLabel.text = menu[indexPath.row]
        return cell
    }
}
