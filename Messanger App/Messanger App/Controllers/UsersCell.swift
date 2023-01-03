//
//  UsersTableViewCell.swift
//  Messanger App
//
//  Created by elham on 1/3/23.
//

import UIKit

class UsersCell: UITableViewCell {

    
    //MARK: - Outlet
    
    @IBOutlet weak var userImageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabelOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
