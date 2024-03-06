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
    
    var token : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Deposit"
        
        setupForm()
        
    }
    
    private func setupForm(){
        
        form +++ Section("Deposit Amount")
        <<< IntRow() { row in
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
    }
    
    @objc func submitTapped() {
           
        
        let errors = form.validate()
                guard errors.isEmpty else {
                    presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
                    return
                }
                let depositRow: IntRow? = form.rowBy(tag: "Deposit")
        
                let Deposit = depositRow?.value ?? 0
                

                    
//                let pet = Pet(id: nil, name: name, adopted: true, image: imageUrl, age: age, gender: gender)
//                    print(pet)
        
                
        
        NetworkManager.shared.deposit(token: token, amountChange: Deposit ){ success in
            
            DispatchQueue.main.async {
         
                switch success{
                case .success(let tokenResponse):
                    print()
                case .failure(let error):
                    print(error)
                }
                }
            }
          }
    private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
}
