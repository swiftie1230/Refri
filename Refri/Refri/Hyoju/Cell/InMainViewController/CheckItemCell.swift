//
//  CheckItemCell.swift
//  Refri
//
//  Created by simyo on 2021/11/05.
//

import UIKit

class CheckItemCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let ItemInfoCollectionViewCellNib = UINib(nibName: "ItemInfoCollectionViewCell", bundle: nil)
        collectionView.register(ItemInfoCollectionViewCellNib, forCellWithReuseIdentifier: "ItemInfoCollectionViewCell")
    }

}

extension CheckItemCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 6개만 보여줄건지?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemInfoCollectionViewCell", for: indexPath) as! ItemInfoCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4
        let height = width*1.6
        return CGSize(width: width, height: height)
    }
    
}
