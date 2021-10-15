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
        
        let categoryNib = UINib(nibName: "CategoryCell", bundle: nil)
        collectionView.register(categoryNib, forCellWithReuseIdentifier: "CategoryCell")
        
    }
    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 12
        } else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryLabel.text = "test"
            return cell
        } else {
            return cell
        }
        
    }


}

