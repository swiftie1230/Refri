//
//  LoginViewController.swift
//  Refri
//
//  Created by simyo on 2021/11/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - 그라데이션 시도
//        backgroundView.setGradient(deep: UIColor(named: "Gradient-deep") ?? .white, soft: UIColor(named: "Gradient-soft") ?? .white)
        
        // MARK: - subView 코너 라운드
        subView.setSubView(subView)
        
        setTextFieldUnderBar(emailTextField)
        setTextFieldUnderBar(passwordTextField)
        
        loginButton.layer.cornerRadius = 25
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
