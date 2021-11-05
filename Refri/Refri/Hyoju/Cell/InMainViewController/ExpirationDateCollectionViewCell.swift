//
//  ExpirationDateCollectionViewCell.swift
//  Refri
//
//  Created by simyo on 2021/11/05.
//

import UIKit

class ExpirationDateCollectionViewCell: UICollectionViewCell {
    let itemArr:[String] = ["","","",""]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        
        
        let ItemInfoCellNib = UINib(nibName: "ItemInfoTableViewCell", bundle: nil)
        tableView.register(ItemInfoCellNib, forCellReuseIdentifier: "ItemInfoTableViewCell")
    }

}

extension ExpirationDateCollectionViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemInfoTableViewCell") as! ItemInfoTableViewCell
        cell.ItemNameLabel.text = "바나나"
        return cell
    }
}


