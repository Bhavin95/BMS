//
//  CellProtocol.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

public protocol TableCellGettable {
    static var reuseIdentifier: String { get }
    static var xibName: String { get }
}

public extension TableCellGettable where Self: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self.classForCoder())
    }
    
    static var xibName: String {
        return String(describing: self.classForCoder())
    }
}
