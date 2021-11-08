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
        
        let CheckItemCellNib = UINib(nibName: "CheckItemCell", bundle: nil)
        collectionView.register(CheckItemCellNib, forCellWithReuseIdentifier: "CheckItemCell")
    }

    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.item {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpirationDateCollectionViewCell", for: indexPath) as! ExpirationDateCollectionViewCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            cell.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckItemCell", for: indexPath) as! CheckItemCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCollectionViewCell
            cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            
          
            
            return cell
        }
        
        
        
    }
    
    


}

