//
//  AddItemCell.swift
//  Refri
//
//  Created by simyo on 2021/10/14.
//

import UIKit

class AddItemCell: UICollectionViewCell {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typePickerView: UIPickerView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var memoTextField: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
