//
//  CreateTikklePageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class CreateTikklePageViewController: UIViewController {
    
    @IBOutlet weak var photoBtn: UIButton!
    
    @IBOutlet weak var openBtn: UIButton!
    @IBOutlet weak var privateBtn: UIButton!
    
    @IBOutlet weak var challengeNameTextField: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var tikkleNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnStyle()
        challengeNameTextFieldStyle()
        infoTextView.delegate = self
        infoTextViewStyle()
        tikkleNameTextFieldStyle()
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
    
    //MARK: - tikkleNameTextField 커스텀
    func tikkleNameTextFieldStyle() {
        tikkleNameTextField.attributedPlaceholder = NSAttributedString(string: "20자 이내로 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexCode: "ADADAD")])
        
        tikkleNameTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tikkleNameTextField.frame.size.height-2, width: tikkleNameTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        tikkleNameTextField.layer.addSublayer((border))
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
