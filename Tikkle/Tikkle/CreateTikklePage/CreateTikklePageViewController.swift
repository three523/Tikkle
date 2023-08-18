//
//  CreateTikklePageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class CreateTikklePageViewController: UIViewController {
    
    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var photoBtn: UIButton!
    
    @IBOutlet weak var openBtn: UIButton!
    @IBOutlet weak var privateBtn: UIButton!
    
    @IBOutlet weak var challengeNameTextField: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBOutlet weak var tikkleNameLable: UILabel!
    private var tikkleVerticalStack: TikkleVerticalStackView = {
        let st = TikkleVerticalStackView()
        st.axis = .vertical
        st.alignment = .leading
        st.distribution = .equalSpacing
        st.spacing = 18
        st.isLayoutMarginsRelativeArrangement = true
        st.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return st
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarButton()
        btnStyle()
        challengeNameTextFieldStyle()
        infoTextView.delegate = self
        infoTextViewStyle()
        initStackView()
    }
    
    //MARK: - challengeNameTextField 커스텀
    func btnStyle() {
        let openButton = CustomButton.makePrivateTrueGrayButton()
        openBtn.addSubview(openButton)
        
        let privateButton = CustomButton.makePrivateFalseGrayButton()
        privateBtn.addSubview(privateButton)
    }
    
    //MARK: - challengeNameTextField 커스텀
    func challengeNameTextFieldStyle() {
        challengeNameTextField.attributedPlaceholder = NSAttributedString(string: "20자 이내로 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexCode: "ADADAD")])
        
        challengeNameTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: challengeNameTextField.frame.size.height-2, width: challengeNameTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        challengeNameTextField.layer.addSublayer((border))
    }
    
    //MARK: - infoTextView 처음 보여지는 화면에서의 안내문구
    func infoTextViewStyle() {
        infoTextView.text = "40자 이내로 입력해주세요."
        infoTextView.textColor = UIColor(hexCode: "ADADAD")
    }
    
    //MARK: - infoTextView 바깥을 클릭하면 편집 종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.infoTextView.resignFirstResponder()
    }
    
    //MARK: Navigation에 완료 버튼 생성
    private func navigationBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveTikkle))
    }
    
    //MARK: NavigationBar에 완료 버튼 클릭 호출되는 함수
    // 적지 않은 내용이 있는지 확인하고 다 작성한 경우 Tikkle 클래스 생성후 화면 닫기
    @objc func saveTikkle() {
        print("save")
        
        guard let challengeNameText = challengeNameTextField.text,
              let infoText = infoTextView.text else { return }
        if challengeNameText.isEmpty || infoText.isEmpty { return }
        let stampList = tikkleVerticalStack.convertStampList()
        if stampList.isEmpty { return }
        
        Tikkle(title: challengeNameText, description: infoText, isPrivate: false, isSharedProject: false, stampList: stampList)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: 수직 스택뷰에 기본 설정 함수
    //수직 스택뷰 오토레이아웃 설정, 수평 스택뷰를 추가하고 그 안에 스탬프 버튼, +버튼 하나씩 추가
    private func initStackView() {
        createScrollView.addSubview(tikkleVerticalStack)
        
        tikkleVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        tikkleVerticalStack.topAnchor.constraint(equalTo: tikkleNameLable.bottomAnchor, constant: 10).isActive = true
        tikkleVerticalStack.leadingAnchor.constraint(equalTo: createScrollView.contentLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tikkleVerticalStack.trailingAnchor.constraint(equalTo: createScrollView.contentLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tikkleVerticalStack.bottomAnchor.constraint(equalTo: createScrollView.contentLayoutGuide.bottomAnchor, constant: -10).isActive = true
        tikkleVerticalStack.widthAnchor.constraint(equalTo: createScrollView.frameLayoutGuide.widthAnchor, constant: -40).isActive = true
        
        let horizontalStackView = createStackView()
        tikkleVerticalStack.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(createStampButton())
        horizontalStackView.addArrangedSubview(createAddButton())
    }
    
    //MARK: 스탬프를 한줄에 3개를 넣어줄 수평 스택뷰 생성 함수
    private func createStackView() -> TikkleHorizontalStackView {
        let horizontalStackView = TikkleHorizontalStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fillProportionally
        horizontalStackView.spacing = 12
        return horizontalStackView
    }
    
    // MARK: 스탬프버튼 생성 함수
    private func createStampButton() -> StampButton {
        let stampButton = StampButton()
        stampButton.backgroundColor = .white.withAlphaComponent(0.2)
        stampButton.isEditeEnabled = true
        stampButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stampButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return stampButton
    }
    
    // MARK: +버튼 생성 함수
    private func createAddButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .subTitleColor
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(createStamp), for: .touchUpInside)
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }
    
    //MARK: +버튼 클릭시 실행되는 함수(StampButton을 만드는 함수)
    @objc func createStamp() {
        // 수직 스택뷰의 맨 밑의 스택뷰를 가져온다.
        guard let horizontalStackView = tikkleVerticalStack.arrangedSubviews.last as? UIStackView else { return }
        // 맨밑의 스택뷰에 있는 버튼의 갯수
        let buttonCount = horizontalStackView.arrangedSubviews.count
        // 버튼이 3개일떄 + 버튼을 클릭한 경우
        if buttonCount == 3 {
            guard let button = horizontalStackView.arrangedSubviews.last else { return }
            
            // 1. 맨마지막 버튼인 +버튼을 지운다
            button.removeFromSuperview()
            // 2. 빈 스탬프 버튼을 생성해서 스택뷰에 넣어준다.
            horizontalStackView.addArrangedSubview(createStampButton())
            // 3. 수평방향의 스택뷰를 생성
            let newHorizontalStackView = createStackView()
            // 4. 새로운 수평 스택뷰에 +버튼 생성
            newHorizontalStackView.addArrangedSubview(createAddButton())
            // 5. 수직 스택뷰에 새로운 수평 스택뷰를 넣어준다,
            tikkleVerticalStack.addArrangedSubview(newHorizontalStackView)
            //6. 현재 스크롤의 위치를 가져온다.
            var contentOffset = createScrollView.contentOffset
            //7. 현재 스크롤 위치에서 120(스택뷰의 크기)만큼 밑으로 설정해준다.
            contentOffset.y += 120
            //8. 120만큼 밑으로 내린 값을 애니메이션과 함께 적용하기
            createScrollView.setContentOffset(contentOffset, animated: true)
        } else {
            // + 버튼을 지우고
            // 새로운 스탬프버튼 생성하고 스택뷰에 추가
            // +버튼을 새로 생성하고 스택뷰에 추가
            guard let button = horizontalStackView.arrangedSubviews.last else { return }
            button.removeFromSuperview()
            horizontalStackView.addArrangedSubview(createStampButton())
            horizontalStackView.addArrangedSubview(createAddButton())
        }
    }
    
}

//MARK: - challengeNameTextField 커스텀
extension CreateTikklePageViewController: UITextViewDelegate {
    //MARK: - infoTextView가 비어있다면 해당 문구를 출력해라
    func textViewDidEndEditing(_ textView: UITextView) {
        if infoTextView.text.isEmpty {
            infoTextView.text =  "40자 이내로 입력해주세요."
            infoTextView.textColor = UIColor(hexCode: "ADADAD")
        }
    }

    //MARK: - infoTextView가 클릭되었을때 ADADAD색 이라면 없애고 흰색으로 바꿔라
    func textViewDidBeginEditing(_ textView: UITextView) {
        if infoTextView.textColor == UIColor(hexCode: "ADADAD") {
            infoTextView.text = nil
            infoTextView.textColor = UIColor.white
        }
    }

}
