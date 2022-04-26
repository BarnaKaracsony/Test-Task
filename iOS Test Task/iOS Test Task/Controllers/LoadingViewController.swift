//
//  LoadingViewController.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 13.04.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createLoadingIndicator()
    }
    
    private func createLoadingIndicator() {
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.sizeToFit()
        loadingIndicator.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
        loadingIndicator.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        loadingIndicator.startAnimating()
        
        view.addSubview(loadingIndicator)
    }
}
