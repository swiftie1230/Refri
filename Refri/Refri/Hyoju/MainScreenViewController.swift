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
        
        let inventoryCellNib = UINib(nibName: "InventoryCollectionViewCell", bundle: nil)
        collectionView.register(inventoryCellNib, forCellWithReuseIdentifier: "InventoryCell")
        
        let expirationDateCollectionViewCellNib = UINib(nibName: "ExpirationDateCollectionViewCell", bundle: nil)
        collectionView.register(expirationDateCollectionViewCellNib, forCellWithReuseIdentifier: "ExpirationDateCollectionViewCell")
        
        let CheckItemCellNib = UINib(nibName: "CheckItemCell", bundle: nil)
        collectionView.register(CheckItemCellNib, forCellWithReuseIdentifier: "CheckItemCell")
        
        let SpacingCellNib = UINib(nibName: "SpacingCell", bundle: nil)
        collectionView.register(SpacingCellNib, forCellWithReuseIdentifier: "SpacingCell")
    }

    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCollectionViewCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 380).isActive = true
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpirationDateCollectionViewCell", for: indexPath) as! ExpirationDateCollectionViewCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 412).isActive = true
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckItemCell", for: indexPath) as! CheckItemCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 419).isActive = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpacingCell", for: indexPath) as! SpacingCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 11).isActive = true
          
            
            return cell
        }
        
        
        
    }
    

}
