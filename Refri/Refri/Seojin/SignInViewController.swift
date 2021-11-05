//
//  SignInViewController.swift
//  Refri
//
//  Created by simyo on 2021/11/02.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subView.setSubView(subView)
    }
    
    @IBAction func actSignInButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
