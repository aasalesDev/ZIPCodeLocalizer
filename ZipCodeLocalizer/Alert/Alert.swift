//
//  Alert.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okay)
        controller.present(alertController, animated: true)
    }
}
