//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 17/03/21.
//

import Foundation

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String = "Sorry", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}

