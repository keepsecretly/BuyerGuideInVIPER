//
//  UIViewController+Alert.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(message:String) {
        let alertView = UIAlertController(title: Localized("Sorry"), message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: Localized("OK"), style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
}
