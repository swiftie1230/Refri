//
//  InventoryCollectionViewCell.swift
//  Refri
//
//  Created by simyo on 2021/11/05.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/3).isActive = true
        
        let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
        collectionView.register(categoryCellNib, forCellWithReuseIdentifier: "CategoryCell")
    }
}

extension InventoryCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//        cell.categoryLabel.text = "test"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        print("width: \(width)")
        let size = CGSize(width: width, height: width)
        return size
    }
    
    
    
    
}
