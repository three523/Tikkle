//
//  TikklePageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class TikklePageViewController: UIViewController {
    
    var tikkle: Tikkle?
    var tikkleList: TikkleListManager = TikkleListManager()
    
    @IBOutlet weak var TikklePageImage: UIImageView!
    @IBOutlet weak var TikklePageTitle: UILabel!
    @IBOutlet weak var TikklePageDaysLabel: UILabel!
    @IBOutlet weak var TikklePageDateLabel: UILabel!
    @IBOutlet weak var TikklePageInfo: UILabel!
    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var TikklePageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSetting()
        uiSet()
        
        TikklePageCollectionView.delegate = self
        TikklePageCollectionView.dataSource = self
    }
    
    //MARK: - TikklePage NavigationBar 커스텀
    func navigationSetting() {
        guard let naviBar = navigationController?.navigationBar else { return }
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.backgroundColor = .black
        naviBar.standardAppearance = naviBarAppearance
        naviBar.scrollEdgeAppearance = naviBarAppearance
        
        self.navigationController?.navigationBar.tintColor = UIColor.mainColor
        self.navigationController?.navigationBar.topItem?.title = ""
        
        let deleteImage = UIImage(named: "delete")
        let deleteImageview = UIImageView(image: deleteImage)
        deleteImageview.contentMode = .scaleAspectFit
        
        //MARK: - TikklePage 포기하기 버튼 커스텀, 클릭 시 deleteAlert 함수 실행
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: deleteImage, style: .plain, target: self, action: #selector(TikklePageViewController.deleteAlert))
    }
    
    //MARK: - 포기하기 버튼 동작
    @objc func deleteAlert() {
        let deleteAlert = UIAlertController(title: "정말로 포기하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let deleteCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        let deleteOKBtn = UIAlertAction(title: "포기", style: .default) { [weak self] _ in
            guard let self, let tikkle else { return }
            
            tikkleList.deleteTikkle(where: tikkle.id)
            self.navigationController?.popViewController(animated: true)
        }
        
        deleteAlert.addAction(deleteCancelBtn)
        deleteAlert.addAction(deleteOKBtn)
        
        self.present(deleteAlert, animated: true)
    }
    
    
    //MARK: - TikklePage Image, Title, Info, 날짜 세팅 가져오기
    func uiSet() {
        updateDaysLabel()
        updateDateLabel()
        
        guard let tikkle else { return }
        TikklePageImage.image = tikkle.image
        TikklePageImage.contentMode = .scaleAspectFill
        TikklePageImage.layer.cornerRadius = TikklePageImage.frame.height / 2
        TikklePageTitle.text = tikkle.title
        TikklePageInfo.text = tikkle.description
        
        
        challengeUpdate(isChallenge: tikkleList.getTikkle(where: tikkle.id) != nil)
    }
    
    
    //날짜 출력 함수
    func updateDateLabel() {
        guard let tikkle = tikkle else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd ~ 현재"
        let formattedDate = dateFormatter.string(from: tikkle.createDate)
        TikklePageDateLabel.text = formattedDate
    }
    
    
    
    //n일 째 도전 중 출력 함수
    func updateDaysLabel() {
        guard let createDate = tikkle?.createDate else { return }

        let currentDate = Date()
        let calendar = Calendar.current

        // createDate와 현재 날짜 사이의 차이 계산
        if let diff = calendar.dateComponents([.day], from: createDate, to: currentDate).day {
            TikklePageDaysLabel.text = "\(diff+1)일째 도전 중"
        }
    }
    
    
    func challengeUpdate(isChallenge: Bool) {
        if isChallenge {
            challengeButton.setTitle("도전중", for: .normal)
            challengeButton.isUserInteractionEnabled = false
            challengeButton.backgroundColor = .subTitleColor
            challengeButton.layer.cornerRadius = 20
            challengeButton.layer.masksToBounds = true
            TikklePageCollectionView.isUserInteractionEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.tintColor = .mainColor
        } else {
            challengeButton.setTitle("도전하기", for: .normal)
            challengeButton.backgroundColor = .mainColor
            challengeButton.layer.cornerRadius = 20
            challengeButton.layer.masksToBounds = true
            TikklePageCollectionView.isUserInteractionEnabled = false
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.tintColor = .clear
        }
        
    }
    @IBAction func callengeStart(_ sender: Any) {
        guard let tikkle else { return }
        tikkleList.addTikkle(tikkle)
        challengeUpdate(isChallenge: true)
    }
}

//MARK: - TikklePage CollectionView Setting
extension TikklePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tikkle?.stampList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TikklePageCollectionView.dequeueReusableCell(withReuseIdentifier: "TikklePageCollectionViewCell", for: indexPath) as! TikklePageCollectionViewCell
        
        cell.TikklePageCellName.text = tikkle?.stampList[indexPath.row].title
        cell.cellUISetting(tikkle: tikkle, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = TikklePageCollectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}
