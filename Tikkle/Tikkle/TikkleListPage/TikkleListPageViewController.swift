//
//  TikkleListPageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class TikkleListPageViewController: UIViewController {
    
    //티끌 정보 담기 위한 변수
    var tikkle: Tikkle?
    let margin: CGFloat = 16
    
    
    //MARK: -티끌리스트매니저 모델 생성 (이제부터 이 매니저 모델을 통해 데이터를 매니징할 수 있음)
    var tikkleListManager = TikkleListManager()
    
    
    //MARK: -TikkleListPage ViewController 스토리보드 요소들 연결
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var createTikkleButton: UIButton!
    
    
    //MARK: -리스트가 비어 있을 시에 안내 문구 표시하는 라벨
    //네모 배경 만들기
    let square: UIView = {
        let squareView = UIView() //UIView를 만들고
        squareView.backgroundColor = UIColor.white.withAlphaComponent(0.05) // 배경은 흰색에 5% 투명도
        squareView.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃을 코드로 설정하기 위해 추가
        return squareView
    }()
    //네모 배경 위에 올라가는 글씨 라벨 만들기
    let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "생성하기를 통해\n티끌시트를 만들어보세요"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0 // 여러 줄 텍스트 표시를 위한 설정
        label.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃을 코드로 설정하기 위해 추가
        
        return label
    }()
    
    
    //MARK: - TikkleListPage ViewController 뷰 실행될 때 처음 실행되는 곳
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatas()
        seupTableView()
        setUI()
        navigationSetting()
        emptyGreetingUI()
    }
    
    
    //MARK: - TikkleListPage ViewController 뷰가 화면에 나타날 때마다 실행되는 곳
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() // 테이블 뷰를 다시 로드하여 데이터 최신화
        emptyGreetingUI() // 빈화면 문구도 업데이트
    }
        
    
    //MARK: -TikkleListPage ViewController viewDidLoad 정리 함수들 모음
    //상단바 세팅 함수. 위의 viewDidLoad 깔끔하게 사용 위함.
    func navigationSetting() {
        guard let naviBar = navigationController?.navigationBar else { return }
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.backgroundColor = .black
        naviBar.standardAppearance = naviBarAppearance
        naviBar.scrollEdgeAppearance = naviBarAppearance
        
        //상단바 왼쪽에 티끌 로고 추가
        let logoImage = UIImage(named: "navi_Logo")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        let logoItem = UIBarButtonItem(customView: logoImageView) //BarButtonItem에 UIImageView와 UIView를 넣는 방식이 있음. 둘의 차이점이 존재. UIImageView를 사용하면 이미지 크기, 콘텐츠 모드(비율 유지&크기조절) 같은 다양한 속성 활용 가능. UIView로 하면 조절 불가능.
        navigationItem.leftBarButtonItem = logoItem
        
        //상단바 오른쪽에 벨 로고 추가
        let bellImage = UIImage(named: "navi_Bell")
        let bellImageView = UIImageView(image: bellImage)
        bellImageView.contentMode = .scaleAspectFit
        let bellItem = UIBarButtonItem(customView: bellImageView)
        navigationItem.rightBarButtonItem = bellItem
    }
    
    //테이블뷰 세팅 함수. 위의 viewDidLoad 깔끔하게 사용 위함.
    func seupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //데이터 세팅 함수. 위의 viewDidLoad 깔끔하게 사용 위함.
    func setupDatas() {
        tikkleListManager.getTikkleList()//데이터(더미데이터) 생성
    }
    
    
    //비어있을 때 실행하는 안내문구 라벨 함수
    func emptyGreetingUI() {
        // 리스트가 비어 있을 경우 안내 UI 보여주기
        if tikkleListManager.getTikkleList().isEmpty {
            
            view.addSubview(square)
                        square.addSubview(emptyStateLabel)

            NSLayoutConstraint.activate([
                // square의 leading, trailing 설정
                square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
                square.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
                
                // square의 top을 createButton의 bottom에서부터 간격을 주게 함
                square.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: margin),
                
                // square의 bottom을 safeArea를 통해 탭바와 겹치지 않게 함
                square.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
                
                // label을 square 내부 중앙에 위치
                emptyStateLabel.centerXAnchor.constraint(equalTo: square.centerXAnchor),
                emptyStateLabel.centerYAnchor.constraint(equalTo: square.centerYAnchor),
                emptyStateLabel.widthAnchor.constraint(lessThanOrEqualTo: square.widthAnchor, multiplier: 0.9)
            ])
        } else {
            square.removeFromSuperview()
            emptyStateLabel.removeFromSuperview()
        }
    }
    
    
    //UI 세팅 함수.위의 viewDidLoad 깔끔하게 사용 위함.
    func setUI() {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold), // 굵기 설정
            .foregroundColor: UIColor.black
        ]
        let attributedText = NSAttributedString(string: "+ 생성하기", attributes: attributes)
        createTikkleButton.setAttributedTitle(attributedText, for: .normal)
        createTikkleButton.backgroundColor = UIColor.mainColor
        createTikkleButton.layer.cornerRadius = 17
        
        view.backgroundColor = .black
        
        //메인라벨과 서브라벨 세팅
        mainLabel.text = "나의 Tikkle 모음"
        subLabel.text = "티끌 모아 태산 !"
        mainLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        subLabel.font = UIFont.systemFont(ofSize: 15, weight: .black)
        subLabel.textColor = UIColor.subTitleColor
    }
}



//MARK: -테이블 뷰 행을 탭할 때 실행
extension TikkleListPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TikklePage", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TikklePageViewController") as? TikklePageViewController else { return }
        vc.tikkle = tikkleListManager[indexPath.item]
        
        
        if tikkleListManager.getTikkleList().isEmpty {
            emptyGreetingUI()
        }
        
        
        
        //MARK: 스토리보드 삭제
        navigationController?.pushViewController(vc, animated: true)
    }
}



//MARK: -테이블 뷰 사용시 필수 구현해야 하는 메소드
extension TikkleListPageViewController: UITableViewDataSource {
    //TikkleListPage 테이블뷰 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tikkleListManager.getTikkleList().count
        
    }
    
    //셀에 데이터 연결하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TikkleListTableViewCell
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // 행간 설정
        
        
        
        //titleLabel---------------------------------------------------------------------
        cell.titleLabel.font = .systemFont(ofSize: 24)
        cell.titleLabel.text = tikkleListManager[indexPath.row].title.description
        
        // 공개 비공개 함깨 버튼 스택뷰 비우기
        cell.edgeStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        //isPrivateButton-----------------------------------------------------------------
        if tikkleListManager[indexPath.row].isPrivate {
            let privateTrueButton = CustomButton.makePrivateTrueButton()
            privateTrueButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            privateTrueButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
            cell.edgeStackView.addArrangedSubview(privateTrueButton)
        } else {
            let privateFalseButton = CustomButton.makePrivateFalseButton()
            privateFalseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            privateFalseButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
            cell.edgeStackView.addArrangedSubview(privateFalseButton)
        }
        
        
        //isSharedProjectButton------------------------------------------------------------
        if tikkleListManager[indexPath.row].isSharedProject {
            let togetherButton =  CustomButton.makeTogetherButton()
            togetherButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            togetherButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
            cell.edgeStackView.addArrangedSubview(togetherButton)
        }
        
        
        //percentLabel---------------------------------------------------------------------
        //isCompletion이 true인 Stamp의 개수
        let completedCount = tikkleListManager[indexPath.row].stampList.filter { $0.isCompletion }.count
        let totalCount = tikkleListManager[indexPath.row].stampList.count
        
        // percentLabel : 퍼센트 값 계산
        let percentage: Double
        if totalCount != 0 { // 나눌 값이 0이면 안돼!
            percentage = (Double(completedCount) / Double(totalCount)) * 100.0
        } else {
            percentage = 0
        }
        
        //percentLabel에 설정
        cell.percentLabel.text = "\(Int(percentage))%"
        
        
        //tikkleImage---------------------------------------------------------------------
        cell.tikkleImage.image = tikkleListManager[indexPath.row].image
        cell.tikkleImage.contentMode = .scaleAspectFill //이미지 채우는 방식
        
        //percentage가 100%일 때, 이미지 어둡게 변하도록
        if percentage == 100 {
            cell.tikkleImage.image = tikkleListManager[indexPath.row].image
            cell.tikkleImage.addoverlay()
            
            // 100%일 때 tikkleDoneSticker 이미지를 추가
            let stickerImageViewTag = 1002
            if cell.tikkleImage.viewWithTag(stickerImageViewTag) == nil {
                let stickerImageView = UIImageView(image: UIImage(named: "tikkleDoneSticker"))
                stickerImageView.contentMode = .scaleAspectFit
                stickerImageView.tag = stickerImageViewTag  // 스티커 이미지 뷰를 식별하기 위한 tag
                stickerImageView.translatesAutoresizingMaskIntoConstraints = false
                cell.tikkleImage.addSubview(stickerImageView)
                
                // 제약 조건 추가. 스티커 이미지 중앙에 배치
                NSLayoutConstraint.activate([
                    stickerImageView.centerXAnchor.constraint(equalTo: cell.tikkleImage.centerXAnchor),
                    stickerImageView.centerYAnchor.constraint(equalTo: cell.tikkleImage.centerYAnchor),
                    stickerImageView.widthAnchor.constraint(equalToConstant: 100),  // 원하는 크기로 조정
                    stickerImageView.heightAnchor.constraint(equalToConstant: 100)  // 원하는 크기로 조정
                ])
            }
        } else {
            let overlayTag = 1001
            if let existingOverlay = cell.tikkleImage.viewWithTag(overlayTag) {
                existingOverlay.removeFromSuperview()
            }
            // 이미지가 100%가 아닐 경우, 기존에 추가된 스티커 이미지 뷰를 제거
            if let stickerView = cell.tikkleImage.viewWithTag(1002) {
                stickerView.removeFromSuperview()
            }
        }
        
        
        //graphImage-----------------------------------------------------------------------
        //위에서 계산한 퍼센티지에 따라 이미지 변경
        var imageName: String
        switch percentage {
        case 0..<10:
            imageName = "graph0"
        case 10..<20:
            imageName = "graph1"
        case 20..<30:
            imageName = "graph2"
        case 30..<40:
            imageName = "graph3"
        case 40..<50:
            imageName = "graph4"
        case 50..<60:
            imageName = "graph5"
        case 60..<70:
            imageName = "graph6"
        case 70..<80:
            imageName = "graph7"
        case 80..<90:
            imageName = "graph8"
        case 90..<100:
            imageName = "graph9"
        case 100:
            imageName = "graph10"
        default:
            imageName = "graph0" // 예외 상황
            print("graphImage Error")
        }
        
        //graphImage에 설정
        cell.graphImage.image = UIImage(named: imageName)
        
        return cell
    }
}


extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.7) {
        let overlayTag = 1001
        if let existingOverlay = self.viewWithTag(overlayTag) {
            existingOverlay.removeFromSuperview()
        }
        
        let overlay = UIView()
        overlay.tag = overlayTag
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        insertSubview(overlay, at: 0)
    }
}

