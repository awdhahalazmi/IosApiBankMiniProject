import UIKit
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
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
    
        <<< TextRow() { row in
            row.title = "Password"
            row.placeholder = "Enter password"
            row.tag = "password"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
        }
        <<< ButtonRow() { row in
            row.title = "Submit"
        }.onCellSelection { _, _ in
            self.signInTapped()
        }
    }
    
    @objc private func signInTapped() {
        
        
        
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        guard let usernameRow: TextRow = form.rowBy(tag: "username"),
              let passwordRow: TextRow = form.rowBy(tag: "password"),
              let username = usernameRow.value,
              let password = passwordRow.value else {
            
            return print("error")
        }
        
        let user = User(username: username, email: "", password: password)
        
        NetworkManager.shared.signIn(user: user) { result in
            switch result {
            case .success(let tokenResponse):
                
                print("Sign in successful. Token: \(tokenResponse.token)")
                DispatchQueue.main.async {
                   
                                    
                    let vC = ViewController()
                    vC.token = tokenResponse.token
                    self.navigationController?.pushViewController(vC, animated: true)

                }
            case .failure(let error):
                
                print("Sign in failed with error: \(error.localizedDescription)")
                DispatchQueue.main.async {
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
