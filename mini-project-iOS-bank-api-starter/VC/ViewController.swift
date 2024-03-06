//
//  ViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Nawaf Almutairi on 05/03/2024.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    var token : String?

    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let balanceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile Page"
        view.backgroundColor = .white
        
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(balanceLabel)
        
        setUpView()
        constrainsLayout()
    }
    
    
    

    func setUpView( ){

        usernameLabel.text = "Username: fawaz"
        emailLabel.text = "Email: email"
        balanceLabel.text = "Balance: balance"
        
        usernameLabel.tintColor = .gray
        emailLabel.tintColor = .gray
        balanceLabel.tintColor = .gray

}
    
    func constrainsLayout(){
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(0)
            
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(0)
            make.width.height.equalTo(20)
            
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(0)
            make.width.height.equalTo(20)
            
        }
    }
}

