//
//  TransactionsTableViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import Alamofire

class TransactionsTableViewController: UITableViewController {
    var token : String?
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchTransactions()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return transactions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")

        let transaction = transactions[indexPath.row]
       
        cell.textLabel?.text = "Transaction: \(transaction.type)"
        cell.textLabel?.numberOfLines = 2
        cell.detailTextLabel?.text = "Amount: \(transaction.amount)"
        if transaction.type == "deposit"{
            cell.detailTextLabel?.text = " + \(transaction.amount)"
            
        } else {
            cell.detailTextLabel?.text = " - \(transaction.amount)"
        }
        cell.detailTextLabel?.textColor = transaction.type == "deposit" ? #colorLiteral(red: 0.01246238127, green: 0.5615252256, blue: 0.3185392618, alpha: 1) : #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        
        return cell
    }
    
    
    
    
    func fetchTransactions() {
        guard let token = token else {
            print("Token is missing")
            return
        }
        
        NetworkManager.shared.getTransactions(token: token) { result in
            switch result {
            case .success(let transactions):
                self.transactions = transactions
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch transactions: \(error)")
                
            }
        }
    }
 
}




