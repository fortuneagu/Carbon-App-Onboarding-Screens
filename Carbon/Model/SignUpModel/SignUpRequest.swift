//
//  LoginRequest.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct SignUpRequest: Encodable {
    
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var gender: String?
    var phoneNumber: String?

}
