//
//  LoginViewController.swift
//  Refri
//
//  Created by simyo on 2021/11/02.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    var token: String = ""
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet var warningLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var email = false
    var pw = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - 그라데이션 시도
//        backgroundView.setGradient(deep: UIColor(named: "Gradient-deep") ?? .white, soft: UIColor(named: "Gradient-soft") ?? .white)
        
        // MARK: - subView 코너 라운드
        subView.setSubView(subView)
        
        setTextFieldUnderBar(emailTextField)
        setTextFieldUnderBar(passwordTextField)
        
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = UIColor.lightGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
              self.view.endEditing(true)
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
        
        // 로그인 버튼 활성화 여부 함수!
        // 채워지지 않은 textField가 한 개라도 존재한다면 로그인 버튼 비활성화 (lightGray)
        // 두 개 다 채워져 있으면 활성화 (AllowColor)
        func whetherAllowLoginOrNot() {
            if email && pw {
                loginButton.backgroundColor = UIColor(named: "Gradient-deep")
            } else {
                loginButton.backgroundColor = UIColor.lightGray
            }
        }
    
    @IBAction func emailTextFieldEdited(_ sender: UITextField) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
                if emailTest.evaluate(with: emailTextField.text) == true {
                    // 만약 이메일 형식과 일치한다면
                    warningLabel.text = ""
                    warningLabel.textColor = UIColor.lightGray
                    emailTextField.layer.borderColor = UIColor.lightGray.cgColor
                    emailTextField.layer.borderWidth = 0
                    email = true
                } else {
                    // 일치하지 않는다면
                    whenTextFieldWrongInput(textField: emailTextField, label: warningLabel, labelText: "올바른 이메일을 입력해주세요.")
                    email = false
                }
                whetherAllowLoginOrNot()
    }
    
    @IBAction func pwTextFieldEdited(_ sender: UITextField) {
        if passwordTextField.text?.count != 0 {
                    pw = true
                }
                whetherAllowLoginOrNot()
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        var id = emailTextField.text ?? ""
        var pw = emailTextField.text ?? ""
                
        if loginButton.backgroundColor == UIColor(named: "Gradient-deep"){
                    
            var parameters = [
                "email" : id,
                "password" : pw
            ]
                    
            AF.request("http://202.150.188.65/api/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { (response) in
                        switch response.result {
                        case .success:
                            print("success")
                            
                            if let value = response.value {
                                let json = JSON(value)
                                self.token = json.stringValue
                                // 토큰 받는지 여부 확인
                                print(self.token)
                            }
                            
                            // performSegue(withIdentifier: "tabBarVC", sender: nil)
            //
            //
            //                guard let VC = self.storyboard?.instantiateViewController(identifier: "tabBarController") else { return }
            //                //VC.modalPresentationStyle = .fullScreen
            //                self.navigationController?.pushViewController(VC, animated: true)
            //                //self.present(VC, animated: true)
            //
                            
                        case .failure(let e):
                            print("Failure!!!\n")
                            //print("e: \(e)")
                            let FailureAlert = UIAlertController(title: "로그인 실패!", message: "등록되지 않은 이메일이거나 비밀번호가 일치하지 않습니다.\n 확인해 주세요.", preferredStyle: UIAlertController.Style.alert)
                            
                            let Action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                            
                            FailureAlert.addAction(Action)
                            self.present(FailureAlert, animated: true, completion: nil)
                        }

                    }
                }
        
    }
    
}


// MARK: - 디자인 요소
extension LoginViewController {
    // MARK: - 텍스트필드 언더바
    func setTextFieldUnderBar(_ textField:UITextField){
        let border = CALayer()
        
        textField.borderStyle = .none
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1,  width: textField.frame.width-32, height: 1)
        border.backgroundColor = UIColor.systemGray4.cgColor
        textField.layer.addSublayer(border)
    }
    
    
    
}

extension UIView {
    func setGradient(deep:UIColor, soft:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [deep.cgColor, soft.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    func setSubView(_ view:UIView){
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
