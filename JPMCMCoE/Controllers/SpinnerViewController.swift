//
//  SpinnerViewController.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 13/06/2022.
//

import UIKit

class SpinnerViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    override func loadView() {
        spinner.color = UIColor.black
        view = UIView()
        view.frame.size.height = 150
        view.frame.size.width = 150
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        view.layer.cornerRadius = 20
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinner.startAnimating()

    }
    

}
