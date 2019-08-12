//
//  AddEditTableViewController.swift
//  Table Views
//
//  Created by Ayu Filippova on 02/08/2019.
//  Copyright © 2019 Dmitry Filippov. All rights reserved.
//

import UIKit

class AddEditTableViewController: UITableViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    @IBOutlet var saveBarButton: UINavigationItem!
    
    
    // MARK: - Properties
    var emoji = Emoji()

    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        saveBarButton.rightBarButtonItem?.isEnabled = false
        symbolTextField.delegate = self
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        usageTextField.delegate = self
    }
    
    //MARK: - Methods
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  symbolTextField.text?.count         == 1     &&
            nameTextField.text?.isEmpty         == false &&
            descriptionTextField.text?.isEmpty  == false &&
            usageTextField.text?.isEmpty        == false
            {
            saveBarButton.rightBarButtonItem?.isEnabled = true
        } else {
            saveBarButton.rightBarButtonItem?.isEnabled = false
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
}
