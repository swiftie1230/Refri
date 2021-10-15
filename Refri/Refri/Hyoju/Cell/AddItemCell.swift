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
    @IBOutlet weak var refiButton: UIButton!
    @IBOutlet weak var frozenButton: UIButton!
    @IBOutlet weak var roomButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var isExpirationSwitch: UISwitch!
    @IBOutlet weak var memoTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
