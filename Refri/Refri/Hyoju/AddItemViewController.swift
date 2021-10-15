//
//  AddItemViewController.swift
//  Refri
//
//  Created by simyo on 2021/10/16.
//

import UIKit

class AddItemViewController: UIViewController {
    
//    var items:[
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

extension AddItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addItemCell", for: indexPath) as? AddItemCell else { return UICollectionViewCell() }
        cell.backgroundColor = .blue
        return cell
    }
}
