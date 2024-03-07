//
//  HomeViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    

    let signinButton = UIButton()
       let signupButton = UIButton()
       let imageView = UIImageView()
       override func viewDidLoad() {
           view.backgroundColor = .white
           title = "Welcome To KFH"
           
           super.viewDidLoad()
           
           view.addSubview(signinButton)
           view.addSubview(signupButton)
           view.addSubview(imageView)

           setUpUI()
           setUpLayout()
           setUpNavigationBar()
           signinButton.addTarget(self, action: #selector(signinTapped), for: .touchUpInside)
           signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
       


       }
       
       func setUpUI(){
           imageView.image = UIImage(named: "kfhimage")
           signinButton.setTitle(" Sign In", for: .normal)
           signinButton.backgroundColor = #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
           signinButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           signinButton.layer.cornerRadius = 10
           signinButton.layer.borderColor = UIColor.black.cgColor
           signinButton.tintColor = .white
           signinButton.setImage(UIImage(systemName: "lock"), for: .normal)
           
           
           signupButton.setTitle(" Sign Up", for: .normal)
           signupButton.backgroundColor =  #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1)
           signupButton.setTitleColor(UIColor.white, for: .normal)
           signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           signupButton.layer.cornerRadius = 10
           
           signupButton.tintColor = .white
           signupButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
           
           
       }
       
       

       func setUpLayout() {
    imageView.snp.makeConstraints { make in
        make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        make.leading.trailing.equalToSuperview().inset(16)
        make.height.equalTo(view.snp.height).multipliedBy(0.3)
    }

    signinButton.snp.makeConstraints { make in
        make.top.equalTo(imageView.snp.bottom).offset(20)
        make.centerX.equalToSuperview()
        make.width.equalTo(180)
        make.height.equalTo(50)
    }

    signupButton.snp.makeConstraints { make in
        make.top.equalTo(signinButton.snp.bottom).offset(20)
        make.centerX.equalToSuperview()
        make.width.equalTo(180)
        make.height.equalTo(50)
    }
}

       func setUpNavigationBar(){
           let appearance = UINavigationBarAppearance()
           appearance.configureWithOpaqueBackground()
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
       }
    

       


       @objc func signinTapped(){
           let signinVC = SigninViewController( )
           self.navigationController?.pushViewController(signinVC, animated: true)
           
       }
       
       
       @objc func signupTapped(){
           let signupVC = SignUpViewController()
           self.navigationController?.pushViewController(signupVC, animated: true)
           
       }
       

       
       

       /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */

   }



