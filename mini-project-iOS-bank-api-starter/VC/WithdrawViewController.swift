//
//  WithdrawViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import Eureka

class WithdrawViewController: FormViewController {
    //let token: TokenResponse
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func setupForm() {
        form +++ Section(" Withdraw page")
        
        <<< DecimalRow { row in
            row.title = "withdraw"
            row.placeholder = "Enter withdraw amount"
            row.tag = "withdraw"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
    
       
        <<< ButtonRow() { row in
            row.title = "Withdraw"
        }.onCellSelection { _, _ in
            self.withdrawTapped()
        }
    }
    
    @objc private func withdrawTapped() {
        
        let withdrawRow: DecimalRow?  = form.rowBy(tag: "withdraw") //as! TextRow
        let withdrawal = withdrawRow?.value ?? 0.0
        
        
        let withdraws = AmountChange(amount: withdrawal)
        
//        NetworkManager.shared.withdraw(token:   , amountChange: ) { Result<Void, Error> in
//            
//
//        }
        
        
//        NetworkManager.shared.withdraw(token: <#T##String#>, amountChange: <#T##AmountChange#>) { success in
//            <#code#>
//        }
//        
//        
//        
//        
        
        
    }

    
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


