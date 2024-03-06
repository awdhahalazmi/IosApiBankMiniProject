//
//  HomeViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
var ButtonSignUp = UIButton()
    var ButtonSignIn = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ButtonSignUp)
        view.addSubview(ButtonSignIn)

        setUpView()
        
    }
    
    func setUpView( ){

        ButtonSignIn.titleLabel?.text = "Sign In"
        ButtonSignUp.titleLabel?.text = "Sign Up"
        ButtonSignIn.tintColor = .gray
        ButtonSignUp.tintColor = .gray

}
    func constrainsLayout()
    {
        ButtonSignIn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        ButtonSignUp.snp.makeConstraints { make in
            make.top.equalTo(ButtonSignIn.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(45)
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

}
