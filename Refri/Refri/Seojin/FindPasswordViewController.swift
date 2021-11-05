//
//  FindPasswordViewController.swift
//  Refri
//
//  Created by simyo on 2021/11/02.
//

import UIKit

class FindPasswordViewController: UIViewController {
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subView.setSubView(subView)
    }
    
    @IBAction func actFindPassword(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
