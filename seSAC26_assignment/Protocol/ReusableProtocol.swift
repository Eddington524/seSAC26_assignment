//
//  ReusableProtocol.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/31/24.
//

import UIKit

protocol ReusableViewProtocol {
    static var idenrifier: String { get }
}

extension UITableViewCell : ReusableViewProtocol {
    static var idenrifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableViewProtocol {
    static var idenrifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableViewProtocol {
    static var idenrifier: String {
        return String(describing: self)
    }
}

