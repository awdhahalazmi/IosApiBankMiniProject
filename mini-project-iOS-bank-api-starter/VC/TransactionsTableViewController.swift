//
//  TransactionsTableViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import UIKit
import Alamofire

class TransactionsTableViewController: UITableViewController {
    
    var transactions: [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 90
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return transactions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let transaction = transactions[indexPath.row]
        cell.textLabel?.text = transaction.senderId
        return cell
    }


}
