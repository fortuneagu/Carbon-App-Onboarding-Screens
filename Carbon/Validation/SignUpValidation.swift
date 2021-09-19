//
//  LoginValidation.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct SignUpValidation {
    
    func validate(signUpRequest: SignUpRequest) -> ValidationResult {
        
        if (signUpRequest.firstName!.isEmpty) {
            return ValidationResult(success: false, error: "First name cannot be empty!")
        }
        
        if (signUpRequest.middleName!.isEmpty) {
            return ValidationResult(success: false, error: "Middle name  is empty!")
        }
        
        if (signUpRequest.lastName!.isEmpty) {
            return ValidationResult(success: false, error: "Last name  is empty!")
        }
        
        if (signUpRequest.email!.isEmpty) {
            return ValidationResult(success: false, error: "Email  is empty!")
        }
        
        if (signUpRequest.password!.isEmpty) {
            return ValidationResult(success: false, error: "password is empty!")
        }
        
        if (signUpRequest.gender!.isEmpty) {
            return ValidationResult(success: false, error: "Gender is empty!")
        }
        
        if (signUpRequest.phoneNumber!.isEmpty) {
            return ValidationResult(success: false, error: "Phone number is empty!")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
