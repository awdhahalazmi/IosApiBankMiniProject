//
//  Account.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Awdhah Alazemi on 06/03/2024.
//

import Foundation
struct Account: Decodable {
    let username: String
    let email: String
    let password: String
    let balance: Double
    let id: Int
}
