//
//  Transactions.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import Foundation
struct Transaction: Decodable {
    let senderId: String
    let receiverId: String
    let amount: Double
    let type: String
}
