//
//  LoginResource.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct SignUpResource {
    
    func signUpUser(signUpRequest: SignUpRequest, completionHandler: @escaping (_ result: SignUpResponse?) -> Void) {
        
        let signUpURL = URL(string: ApiEndpoints.signUp)!
        let httpUtility = HTTPUtility()
        
        do {
            let signUpPostBody = try JSONEncoder().encode(signUpRequest)
            httpUtility.postAPIData(requestUrl: signUpURL, requestBody: signUpPostBody, resultType: SignUpResponse.self) { signUpAPIResponse in
                
                completionHandler(signUpAPIResponse)
            }
            
        } catch let error {
            debugPrint(error)
        }
    }
}
