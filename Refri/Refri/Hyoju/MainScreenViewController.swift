//
//  MainScreenViewController.swift
//  Refri
//
//  Created by simyo on 2021/10/08.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inventoryCellNib = UINib(nibName: "InventoryCollectionViewCell", bundle: nil)
        collectionView.register(inventoryCellNib, forCellWithReuseIdentifier: "InventoryCell")
        
        let expirationDateCollectionViewCellNib = UINib(nibName: "ExpirationDateCollectionViewCell", bundle: nil)
        collectionView.register(expirationDateCollectionViewCellNib, forCellWithReuseIdentifier: "ExpirationDateCollectionViewCell")
        
    }
    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.item {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpirationDateCollectionViewCell", for: indexPath) as! ExpirationDateCollectionViewCell
            
            cell.tableView.backgroundColor = .purple
            return cell
        case 2:
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCollectionViewCell
            
            
            return cell
        }
        
        
        
    }
    
    


}

