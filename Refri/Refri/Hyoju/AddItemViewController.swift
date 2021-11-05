//
//  AddItemViewController.swift
//  Refri
//
//  Created by simyo on 2021/10/16.
//

import UIKit

class AddItemViewController: UIViewController {
    
    // MARK: [TODO] 나중에 모델 만들어서 배열 타입 모델로 변경
    var items:[String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibName = UINib(nibName: "AddItemCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "addItemCell")
    }
    
    // MARK: - 버튼 이벤트
    @IBAction func actAddItem(_ sender: Any) {
        items.append("test")
        print("\(items.count)")
        self.collectionView.reloadData()    
    }
    
    

}

extension AddItemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addItemCell", for: indexPath) as? AddItemCell else { return UICollectionViewCell() }
        cell.backgroundColor = .gray
        cell.nameTextField?.text = "test"
        return cell
    }
    
    // MARK: - DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: 224)
    }
    
}
