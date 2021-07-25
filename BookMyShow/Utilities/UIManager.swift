//
//  UIManager.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/25/21.
//

import Foundation
import UIKit

class UIManager {
    static let shared = UIManager()
    
    // MARK: - Spinner -

    static var vSpinner: UIView?
    @available(iOS 13.0, *)
    static func showSpinner(onView :UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }

        vSpinner = spinnerView
    }

    static func removeSpinner() {
        DispatchQueue.main.async {
            UIManager.self.vSpinner?.removeFromSuperview()
            UIManager.self.vSpinner = nil
        }
    }
    
    // MARK: - Alerts / ActionSheet -
    
    static func showAlert(title: String? = "", msg: String?, btns: [String] = ["Okay"], completionBlock: ((_ btn:Int)->())?) {
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)

        for (n, btn) in btns.enumerated() {
            let action = UIAlertAction.init(title: btn, style: .default) { (action) in
                alertVC.dismiss(animated: true, completion: nil)
                completionBlock?(n)
            }
            alertVC.addAction(action)
        }
        DispatchQueue.main.async {
            AppConstants.appDelegate.window?.rootViewController?.present(alertVC, animated: true, completion: nil)
        }
    }
}
