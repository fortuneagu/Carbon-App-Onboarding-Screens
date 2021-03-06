//
//  LoginResponse.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct SignUpResponse: Decodable {

    let errorMessage: String?
    let data: SignUpResponseData?
}

struct SignUpResponseData: Decodable {
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}

