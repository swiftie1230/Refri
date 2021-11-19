//
//  SignInViewController.swift
//  Refri
//
//  Created by simyo on 2021/11/02.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var subView: UIView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var pwConfirmTextField: UITextField!
    @IBOutlet var finishButton: UIButton!
    @IBOutlet var linkTextView: UITextView!
    @IBOutlet var warningLabel: UILabel!
    
    var nickName = false
    var email = false
    var pw = false
    var pwCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subView.setSubView(subView)
        
        idTextField.delegate = self
        
        linkTextView.textAlignment = NSTextAlignment.center
        
        // 개인정보 & 이용약관 링크
        let attributedString = NSMutableAttributedString(string: "가입 시 이용약관을 포함한 개인정보 처리방침에 동의합니다.")
        attributedString.addAttribute(.link, value: "https://swiftie1230.github.io", range: NSRange(location:5, length: 4))
        attributedString.addAttribute(.link, value: "https://www.notion.so/iOS-14a048ecb7064f5aa33900b34fc47a77", range: NSRange(location:15, length: 9))
        linkTextView.attributedText = attributedString
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
    // 입력된 정보가 틀렸을 경우, textField가 살짝 떨리는 애니메이션&textField 테두리 붉게 변하는 함수.
    func whenTextFieldWrongInput(textField: UITextField, label: UILabel, labelText: String) -> Void{
        UIView.animate(withDuration: 0.2, animations: {
            textField.frame.origin.x -= 5
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x += 10
             }, completion: { _ in
                 UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x -= 5
                })
            })
        })
        label.text = labelText
        label.textColor = UIColor.red
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    // 가입하기 버튼 활성화 여부 함수!
    // 채워지지 않은 textField가 한 개라도 존재한다면 가입하기 버튼 비활성화 (lightGray)
    // 두 개 다 채워져 있으면 활성화 (AllowColor)
    func whetherAllowRegisterOrNot () {
        if nickName && email && pw && pwCheck {
            finishButton.backgroundColor = UIColor(named: "AllowColor")
        } else {
            finishButton.backgroundColor = UIColor.lightGray
        }
    }
    
    // textField 글자 수 제한 위한 함수
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }
    
    @IBAction func idTextFieldEdited(_ sender: Any) {
        checkMaxLength(textField: idTextField, maxLength: 8)
        nickName = true
        whetherAllowRegisterOrNot()
    }
    
    @IBAction func emailTextFieldEdited(_ sender: Any) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: emailTextField.text) == true {
            // 만약 이메일 형식과 일치한다면
            warningLabel.text = ""
            warningLabel.textColor = UIColor.lightGray
            emailTextField.layer.borderColor = UIColor.lightGray.cgColor
            email = true
        } else {
            // 일치하지 않는다면
            whenTextFieldWrongInput(textField: emailTextField, label: warningLabel, labelText: "형식에 맞지 않는 이메일입니다.")
            email = false
        }
        whetherAllowRegisterOrNot()
    }
    
    @IBAction func pwTextFieldEdited(_ sender: Any) {
        let passwordRegEx = "^[a-zA-Z0-9\\d$@$!%*?&]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        if passwordTest.evaluate(with: pwTextField.text) == true {
            warningLabel.text = ""
            warningLabel.textColor = UIColor.lightGray
            pwTextField.layer.borderColor = UIColor.lightGray.cgColor
            pw = true
        } else {
            whenTextFieldWrongInput(textField: pwTextField, label: warningLabel, labelText: "영어 대/소문자, 숫자, 특수문자 중 3종류 조합 8자리 이상")
            pw = false
        }
        whetherAllowRegisterOrNot()
    }
    
    @IBAction func pwConfirmTextFieldEdited(_ sender: Any) {
        if pwTextField.text != pwConfirmTextField.text {
            whenTextFieldWrongInput(textField: pwConfirmTextField, label: warningLabel, labelText: "비밀번호가 일치하지 않습니다.")
            pwCheck = false
        } else {
            pwConfirmTextField.layer.borderColor = UIColor.lightGray.cgColor
            warningLabel.text = ""
            pwCheck = true
        }
        whetherAllowRegisterOrNot()
    }
    
    @IBAction func actSignInButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        var email = emailTextField.text ?? ""
        var pw = pwTextField.text ?? ""
        var nickName = idTextField.text ?? ""
        
        if finishButton.backgroundColor == UIColor(named: "AllowColor") {
                
            var parameters = [
                "email" : email,
                "password" : pw,
                "nickname" : nickName
            ]
                
            AF.request("http://202.150.188.65/api/users", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
                    
                    // 응답코드 확인 -> 성공응답코드이면 성공(회원가입이 완료되었습니다.), 아니라면 실패(오류발생:오류코드)
                    switch response.result {
                    case .success:
                        print("success")
                        
                        if let value = response.value {
                            var json = JSON(response.value!)
                        }
                        let successAlert = UIAlertController(title: "회원가입 성공!", message: "회원가입이 완료되었습니다.\n", preferredStyle: UIAlertController.Style.alert)
                        
                        let Action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler:{ACTION in self.navigationController?.popViewController(animated: true)})
                        
                        successAlert.addAction(Action)
                        self.present(successAlert, animated: true, completion: nil)
                        
     
                    case .failure(let e):
                        print("e: \(e)")
                        let failureAlert = UIAlertController(title: "회원가입 실패!", message: "이미 사용중인 닉네임이거나 등록된 이메일입니다.\n 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
                        
                        let Action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                        
                        failureAlert.addAction(Action)
                        self.present(failureAlert, animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
