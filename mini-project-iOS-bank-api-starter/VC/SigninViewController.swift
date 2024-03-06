//
//  SigninViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import Alamofire
import Eureka


class SigninViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm()
    }
    
    
    private func setupForm() {
        form +++ Section("Enter User Name")
        <<< TextRow() { row in
            row.title = "Username"
            row.placeholder = "Enter User Name"
            row.tag = "username"
            //            row.cellUpdate { cell, row in
            //                if !row.isValid {
            //                    cell.titleLabel?.textColor = .red
            // }
            
        }
        
        
        
        <<< TextRow() { row in
            row.title = "Passwpord"
            row.placeholder = "Enter password"
            row.tag = "password"
            //            row.cellUpdate { cell, row in
            //                if !row.isValid {
            //                    cell.titleLabel?.textColor = .red
            // }
            
        }
        
        <<< ButtonRow() { row in
            row.title = "submit"
        }.onCellSelection { _, _ in
            self.addPetTapped()
        }
        
        
        
    }
    
    @objc func addPetTapped() {
        // validation
//        let errors = form.validate()
//        guard errors.isEmpty else {
//            presentAlertWithTitle(title: "Error", message: "Please fill out all fields.")
//            return
//        }
        
        let usernameRow: TextRow? = form.rowBy(tag: "username")
        let passwordRow: TextRow? = form.rowBy(tag: "password")

     
        let name = usernameRow?.value ?? ""
        let passsord = passwordRow?.value ?? ""
        

        
      
        
    
        
            let user = User(username: name, email: "", password: passsord)
        
        //NetworkManager.shared.
            }
        
    }
    

