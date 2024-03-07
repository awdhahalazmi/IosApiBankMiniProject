////
////  ViewController.swift
////  mini-project-iOS-bank-api-starter
////
////  Created by Nawaf Almutairi on 05/03/2024.
////
//
import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController,  UIAdaptivePresentationControllerDelegate   {
    let imageTwoView = UIImageView()
    let cardView = UIView()
    var token : String?
    var account : Account?
    
    let depositButton = UIButton()
    let withdrawButton = UIButton()
    
    let usernameLabel = UILabel()
    let idLabel = UILabel()
    
    let emailLabel = UILabel()
    let balanceLabel = UILabel()
    
    let imageprofile = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        view.addSubview(imageTwoView)
        view.addSubview(cardView)
        cardView.addSubview(usernameLabel)
        cardView.addSubview(emailLabel)
        cardView.addSubview(balanceLabel)
        view.addSubview(depositButton)
        view.addSubview(withdrawButton)
        view.addSubview(imageprofile)
        fetch( )
        setUpView()
        constrainsLayout()
        setupNavigationBar()
        didCompleteTransaction( )
        
        depositButton.addTarget(self, action: #selector(depositTapped), for: .touchUpInside)
        withdrawButton.addTarget(self, action: #selector(withdrawTapped), for: .touchUpInside)
        
    }
    
    
    
    
    func setUpView( ){
        imageTwoView.image = UIImage(named: "kfh")
        imageprofile.image = UIImage(systemName: "person.crop.square")
        imageprofile.tintColor = .white
   

        usernameLabel.text = "Username: "
              usernameLabel.textColor = .white
              emailLabel.text = "Email: email"
              emailLabel.textColor = .white
              idLabel.text = "id: "
        
        balanceLabel.text = "Balance: balance"
                balanceLabel.textColor = .white
                usernameLabel.tintColor = .gray
                emailLabel.tintColor = .gray
                balanceLabel.tintColor = .gray
        
                depositButton.setTitle(" Deposit", for: .normal)
                depositButton.backgroundColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
                depositButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                depositButton.layer.cornerRadius = 10
                depositButton.layer.borderColor = UIColor.black.cgColor
                depositButton.tintColor = .white
                depositButton.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        
        
        withdrawButton.setTitle(" withdraw", for: .normal)
               withdrawButton.backgroundColor =  #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
               withdrawButton.setTitleColor(UIColor.white, for: .normal)
               withdrawButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
               withdrawButton.layer.cornerRadius = 10
               
               withdrawButton.tintColor = .white
               withdrawButton.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        
        cardView.backgroundColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
                cardView.layer.cornerRadius = 10
                cardView.layer.shadowColor = UIColor.black.cgColor
                cardView.layer.shadowOpacity = 0.5
                cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
                cardView.layer.shadowRadius = 4
        
    }
    

    func constrainsLayout() {
        
        
        imageTwoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.width.equalToSuperview()
                }

        usernameLabel.snp.makeConstraints { make in
                    make.top.equalTo(cardView.snp.top).offset(20)
                    make.centerX.equalToSuperview()
                    make.trailing.equalToSuperview().offset(-20)
                }
        imageprofile.snp.makeConstraints { make in
            make.leading.equalTo(cardView.snp.trailing).offset(-100)
            make.centerY.equalToSuperview().offset(40)
            make.width.equalTo(100)
            make.height.equalTo(120)
        }

        emailLabel.snp.makeConstraints { make in
                   make.top.equalTo(usernameLabel.snp.bottom).offset(20)
                   make.centerX.equalToSuperview()
                   make.trailing.equalToSuperview().offset(-20)
                   make.width.height.equalTo(20)
               }
        cardView.snp.makeConstraints { make in
            make.top.equalTo(imageTwoView.snp.bottom).offset(40)
                 make.centerX.equalToSuperview()
                 make.width.equalTo(320)
                 make.height.equalTo(170)
             }
        balanceLabel.snp.makeConstraints { make in
                    make.top.equalTo(emailLabel.snp.bottom).offset(20)
                    make.centerX.equalToSuperview()
                    make.trailing.equalToSuperview().offset(-20)
                    make.width.height.equalTo(20)
                }
        depositButton.snp.makeConstraints { make in
                   make.top.equalTo(cardView.snp.bottom).offset(40)
                   make.leading.equalToSuperview().offset(40)
                   make.width.equalTo(320)
                   make.height.equalTo(75)
               }

        withdrawButton.snp.makeConstraints { make in
                   make.top.equalTo(depositButton.snp.bottom).offset(20)
                   make.leading.equalToSuperview().offset(40)
       
                   make.width.equalTo(320)
                   make.height.equalTo(75)
               }
    }

    @objc func depositTapped(){
        let depositVC = DepositViewController( )
        if let sheet = depositVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
                    sheet.largestUndimmedDetentIdentifier = .medium
                    sheet.prefersScrollingExpandsWhenScrolledToEdge = true
                sheet.prefersGrabberVisible = true
            
        }
        
  
        self.present(depositVC, animated: true )
        depositVC.token = token
        depositVC.delegate = self
   
        
    }
    
    func setupNavigationBar() {
        let infoButton = UIBarButtonItem(
            image: UIImage(systemName: "creditcard.and.123"),
        
            style: .plain,
            target: self,
            action: #selector(transactionButtonTapped)
        )
        let transfer = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left.arrow.right.square"),
        
            style: .plain,
            target: self,
            action: #selector(transferButtonTapped)
        )
        infoButton.tintColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
        navigationItem.leftBarButtonItem = infoButton
        
        transfer.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        navigationItem.rightBarButtonItem = transfer
        
        
    }
    
    @objc func transactionButtonTapped() {
        
        let transactionVC = TransactionsTableViewController()
        transactionVC.token = token

        navigationController?.pushViewController(transactionVC, animated: true)
    }
    @objc func transferButtonTapped() {
        
        let transfertionVC = TransferViewController( )
        transfertionVC.token = token
        navigationController?.pushViewController(transfertionVC, animated: true)
    }
    
    @objc func withdrawTapped(){
        let withdrawVC = WithdrawViewController()
        
        if let sheet = withdrawVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
                    sheet.largestUndimmedDetentIdentifier = .medium
                    sheet.prefersScrollingExpandsWhenScrolledToEdge = true
                sheet.prefersGrabberVisible = true
            
        }
        self.present(withdrawVC, animated: true )

        withdrawVC.token = token
        withdrawVC.delegate = self
        
    }
    
    
    
    func fetch() {
        guard let token = token else {
            print("Token is missing")
            return
        }
        
        NetworkManager.shared.getAdccountDetails(token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let details):
                    self.title = "\(details.username )"
                    self.usernameLabel.text = details.username
                    self.balanceLabel.text = "\(details.balance) KD"
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
          

extension ViewController: TransactionDelegate {
    func didCompleteTransaction() {
        fetch()
    }
}




