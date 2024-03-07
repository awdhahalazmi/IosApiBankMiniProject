//
//  DepositViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fawaz Alzamel on 06/03/2024.
//

import Foundation
import Alamofire
import Eureka
import SnapKit
import UIKit

class DepositViewController : FormViewController{
    weak var delegate: TransactionDelegate?
    
    var token : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Deposit"
        
        setupForm()
        
    }
    
    private func setupForm(){
        
        form +++ Section("Deposit Amount")
        <<< DecimalRow { row in
            row.title = "Deposit Amount"
            row.placeholder = "Enter Deposit Amount"
            row.tag = "Deposit"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< ButtonRow() { row in
            row.title = "Deposit"
        }.onCellSelection { _, _ in
            self.depositTapped()
        }
    
    }
    
    @objc func depositTapped() {
           
        
        let errors = form.validate()
                guard errors.isEmpty else {
                    presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
                    return
                }
                let depositRow: DecimalRow? = form.rowBy(tag: "Deposit")
        
        let deposit = depositRow?.value ?? 0.0
        let deposits = AmountChange(amount: deposit)


        NetworkManager.shared.deposit(token: token ?? "", amountChange: deposits) { result in
            print(self.token)
            print(deposits)
            if self.token == nil {
                print("Token not found!!!!")
            } else {
                switch result {
                    
                case .success:
                    print("Deposit successful")
                    
                case .failure(let error):
                    print("Deposit failed: \(error.localizedDescription)")
                    
                }
                
            }
        }}


    private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
}
