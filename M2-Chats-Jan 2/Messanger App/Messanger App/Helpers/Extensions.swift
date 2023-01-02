//
//  Extensions.swift
//  Messanger App
//
//  Created by Shatha on 08/06/1444 AH.
//

import Foundation
import UIKit






extension Date {
    func longDate()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd mmm yyyy"
        return dateFormatter.string(from: self)
    }
}
