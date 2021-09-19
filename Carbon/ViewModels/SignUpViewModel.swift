//
//  LoginViewModel.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

protocol SignUpViewModelDelegate {
    func didReceiveSignUpResponse(signUpResponse: SignUpResponse?)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    
    func signUpUser(signUpRequest: SignUpRequest) {
        
        let validationResult = SignUpValidation().validate(signUpRequest: signUpRequest)
        
        if (validationResult.success) {
            
            // Use loginResult to call Login API
            let signUpResource = SignUpResource()
            signUpResource.signUpUser(signUpRequest: signUpRequest) { (signUpAPIResponse) in
                
                guard
                    signUpAPIResponse?.errorMessage == nil,
                    signUpAPIResponse?.data != nil,
                    let userID = signUpAPIResponse?.data?.userID else {
                    return
                }
                
                UserDefaultUtility.saveUserID(userID: userID)
                
                DispatchQueue.main.async {
                    self.delegate?.didReceiveSignUpResponse(signUpResponse: signUpAPIResponse)
                }
            }
        }
        
        self.delegate?.didReceiveSignUpResponse(signUpResponse:
                                                SignUpResponse(errorMessage:
                                                                validationResult.error,
                                                              data: nil))
    }
}
