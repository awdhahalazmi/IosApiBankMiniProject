//
//  ViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Nawaf Almutairi on 05/03/2024.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController   {
    
    var token : String?
    var account : Account?
    
    let depositButton = UIButton()
    let withdrawButton = UIButton()
    
    let usernameLabel = UILabel()
    let idLabel = UILabel()
    
    let emailLabel = UILabel()
    let balanceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile Page"
        view.backgroundColor = .white
        
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(balanceLabel)
        view.addSubview(depositButton)
        view.addSubview(withdrawButton)
        fetch( )
        
        setUpView()
        constrainsLayout()
        setupNavigationBar()
        didCompleteTransaction( )
        
        depositButton.addTarget(self, action: #selector(depositTapped), for: .touchUpInside)
        withdrawButton.addTarget(self, action: #selector(withdrawTapped), for: .touchUpInside)
        
    }
    
    
    
    
    func setUpView( ){
        
        usernameLabel.text = "Username: "
        emailLabel.text = "Email: email"
        idLabel.text = "id: "
        
        balanceLabel.text = "Balance: balance"
        
        usernameLabel.tintColor = .gray
        emailLabel.tintColor = .gray
        balanceLabel.tintColor = .gray
        
        depositButton.setTitle(" Deposit", for: .normal)
        depositButton.backgroundColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
        depositButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        depositButton.layer.cornerRadius = 10
        depositButton.layer.borderColor = UIColor.black.cgColor
        depositButton.tintColor = .white
        depositButton.setImage(UIImage(systemName: "plus"), for: .normal)
        
        
        withdrawButton.setTitle(" withdraw", for: .normal)
        withdrawButton.backgroundColor =  #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        withdrawButton.setTitleColor(UIColor.white, for: .normal)
        withdrawButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        withdrawButton.layer.cornerRadius = 10
        
        withdrawButton.tintColor = .white
        withdrawButton.setImage(UIImage(systemName: "minus"), for: .normal)
        
        
    }
    
//    func constrainsLayout(){
//        
//        usernameLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.centerX.equalToSuperview()
//            make.trailing.equalToSuperview().offset(0)
//            
//        }
//        
//        emailLabel.snp.makeConstraints { make in
//            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//            make.trailing.equalToSuperview().offset(0)
//            make.width.height.equalTo(20)
//            
//        }
//        
//        balanceLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailLabel.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//            make.trailing.equalToSuperview().offset(0)
//            make.width.height.equalTo(20)
//            
//        }
//        depositButton.snp.makeConstraints { make in
//            make.top.equalTo(balanceLabel.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(180)
//            make.height.equalTo(50)
//        }
//        
//        withdrawButton.snp.makeConstraints { make in
//            make.top.equalTo(depositButton.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(180)
//            make.height.equalTo(50)
//        }
//    }
    func constrainsLayout() {
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

        depositButton.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40) // Aligning depositButton to the leading edge with a margin of 20
            make.width.equalTo(140)
            make.height.equalTo(50)
        }

        withdrawButton.snp.makeConstraints { make in
            make.top.equalTo(depositButton.snp.top) // Aligning the top of the withdrawButton with the top of the depositButton
            //make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(depositButton.snp.trailing).offset(20)

            make.width.equalTo(140)
            make.height.equalTo(50)
        }
    }

    @objc func depositTapped(){
        let depositVC = DepositViewController( )
        depositVC.token = token
        depositVC.delegate = self
        self.navigationController?.pushViewController(depositVC, animated: true)
        
    }
    
    func setupNavigationBar() {
        let infoButton = UIBarButtonItem(
            image: UIImage(systemName: "dollarsign.arrow.circlepath"),
        
            style: .plain,
            target: self,
            action: #selector(transactionButtonTapped)
        )
        infoButton.tintColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
        navigationItem.leftBarButtonItem = infoButton
    }
    
    @objc func transactionButtonTapped() {
        let transactionVC = TransactionsTableViewController()
        transactionVC.token = token
        navigationController?.pushViewController(transactionVC, animated: true)
    }
    
    @objc func withdrawTapped(){
        let withdrawVC = WithdrawViewController()
        withdrawVC.token = token
        withdrawVC.delegate = self
        self.navigationController?.pushViewController(withdrawVC, animated: true)
        
    }
    
    //    func fetch(){
    //        NetworkManager.shared.getAdccountDetails(token: token ?? "") { result in
    //
    //            DispatchQueue.main.async {
    //                switch result {
    //
    //                case .success(let details):
    //                    self.usernameLabel.text = details.username
    //                    self.balanceLabel.text = String(details.balance)
    //                    self.emailLabel.text = details.email
    //                    self.idLabel.text = String(details.id)
    //
    //
    //
    //                case .failure(let error ):
    //                    print(error)
    //
    //                }
    //            }
    //
    //        }
    //    }
    
    func fetch() {
        guard let token = token else {
            print("Token is missing")
            return
        }
        
        NetworkManager.shared.getAdccountDetails(token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let details):
                    self.usernameLabel.text = details.username
                    self.balanceLabel.text = String(details.balance)
                    self.emailLabel.text = details.email
                    self.idLabel.text = String(details.id)
                    self.didCompleteTransaction( )
                case .failure(let error):
                    print("Failed to fetch account details: \(error)")
                }
            }
        }
    }
    
        }
        //getAccountDetails(token: token) { result in
          

extension ViewController: TransactionDelegate {
    func didCompleteTransaction() {
        fetch()
    }
}
