//
//  LoginViewController+Extensions.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import UIKit


extension SignupPageViewController: SignUpViewModelDelegate {
    
    func didReceiveSignUpResponse(signUpResponse: SignUpResponse?) {
        
        if (signUpResponse?.errorMessage == nil && signUpResponse?.data != nil) {
           
//            let employeeViewController = storyboard?.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
//                  self.navigationController?.pushViewController(employeeViewController, animated: true)
            
            debugPrint("Moving to the employee's screen...")
            
        } else if (signUpResponse?.errorMessage != nil) {
            
            guard let errorMessage = signUpResponse?.errorMessage else {
                return
            }
            let alert = AlertService.alert(with: Constants.ErrorAlertTitle,
                                           message: errorMessage,
                                           alertStyle: .alert)
            
            self.present(alert, animated: true)
        }
    }
}
