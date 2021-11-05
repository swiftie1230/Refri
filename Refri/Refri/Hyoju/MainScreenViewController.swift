//
//  MainScreenViewController.swift
//  Refri
//
//  Created by simyo on 2021/10/08.
//

import UIKit

class MainScreenViewController: UIViewController {
    var sectionArray:[UICollectionViewCell]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section {
        case 1:
            return UITableViewCell()
        case 2:
            return UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
            return UITableViewCell()
        }
        
    }
    
    //MARK: - set header of tableView section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 1:
            return "빨리 먹어야해요"
        case 2:
            return "재료들을 확인해 보세요"
        default:
            return "(id)님의 냉장고는?"
        }
    }
    

}
