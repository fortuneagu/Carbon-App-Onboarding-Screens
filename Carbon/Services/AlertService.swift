//
//  AlertService.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import UIKit

struct AlertService {
        
    static func alert(with title: String,
                      message: String,
                      alertStyle: UIAlertController.Style) -> UIAlertController {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: alertStyle)

        alert.addAction(UIAlertAction(title: Constants.OkAlertTitle,
                                      style: .default,
                                      handler: nil))
        
        return alert
    }
}
