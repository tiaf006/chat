//
//  ChatTableViewCell.swift
//  Messanger App
//
//  Created by Shatha on 08/06/1444 AH.
//

import UIKit

//this class is for generating the cell for the usersChatse table

class ChatTableViewCell: UITableViewCell {
//MARK:- IBOutlets
    @IBOutlet weak var avatarImageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var unreadCounterLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageOutlet.RounedSmall()
        avatarImageOutlet.clipsToBounds = true
        avatarImageOutlet.layer.borderWidth = 1
        avatarImageOutlet.layer.borderColor = UIColor.systemGray.cgColor
        
        unreadCounterLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        unreadCounterLabel.widthAnchor.constraint(equalToConstant: 24).isActive = true
        unreadCounterLabel.clipsToBounds = true
        unreadCounterLabel.layer.cornerRadius = 24/2.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure (chatRoom: ChatRoom ){
        userNameLabel.text = chatRoom.receiverName
        userNameLabel.minimumScaleFactor = 0.9
        
        lastMessageLabel.text = chatRoom.lastMessage
        lastMessageLabel.numberOfLines = 2
        lastMessageLabel.minimumScaleFactor = 0.9
        
        if chatRoom.unreadCounter != 0{
            self.unreadCounterLabel.text = "\(chatRoom.unreadCounter)"
            self.unreadCounterLabel.isHidden = false
        }else{
            self.unreadCounterLabel.isHidden = true
        }
    }
}
