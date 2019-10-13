//
//  UIViewController+Spinner.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 12/10/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

var spinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(white: 0, alpha: 0.5)

        let indicator = UIActivityIndicatorView.init(style: .whiteLarge)
        indicator.center = spinnerView.center
        indicator.startAnimating()

        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }

        spinner = spinnerView
    }

    func removeSpinner() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}
