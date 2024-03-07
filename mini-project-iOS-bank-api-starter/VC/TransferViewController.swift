//
//  TransferViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 07/03/2024.
//

import UIKit
import Eureka

class TransferViewController: FormViewController {
    var token: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm( )
        // Do any additional setup after loading the view.
    }
    private func setupForm() {
        form +++ Section("Transfer Funds")
            <<< TextRow() { row in
                row.title = "Amount"
                row.placeholder = "Enter amount"
                row.tag = "amount"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }
            <<< TextRow() { row in
                row.title = "Recipient Username"
                row.placeholder = "Enter recipient's username"
                row.tag = "recipientUsername"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }
            <<< ButtonRow() { row in
                row.title = "Transfer"
            }.onCellSelection { _, _ in
                self.transferTapped()
            }
    }

    @objc private func transferTapped() {
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        guard let amountRow: TextRow = form.rowBy(tag: "amount"),
              let recipientUsernameRow: TextRow = form.rowBy(tag: "recipientUsername"),
              let amountText = amountRow.value, let amount = Double(amountText),
              let recipientUsername = recipientUsernameRow.value else {
            return print("Error")
        }
        let transfer = AmountChange(amount: amount)
        
    }

    
    private func presentAlertWithTitle(title: String, message: String) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true, completion: nil)
            }
    

}
