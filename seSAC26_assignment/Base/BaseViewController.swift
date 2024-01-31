//
//  BaseViewController.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/31/24.
//

import UIKit

class BaseViewController: UIViewController, configureViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    func configureHierarchy() {
        
    }
    
    func configureConstraints() {
        
        
    }
    
    func configureView(){
        
    }
    

}
