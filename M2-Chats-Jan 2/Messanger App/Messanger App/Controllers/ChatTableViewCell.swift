//
//  ChatTableViewCell.swift
//  Messanger App
//
//  Created by Shatha on 08/06/1444 AH.
//

import UIKit



class ChatTableViewCell: UITableViewCell {
    
    
//MARK:- IBOutlets

    @IBOutlet weak var avatarImageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unreadCounterLabel: UILabel!
    @IBOutlet weak var unreadCounterView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // change shap
        unreadCounterView.layer.cornerRadius = unreadCounterView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        //MARK:- shatha
        //        if chatRoom.avatarLink != "" {
        //            FileStorege.downloadImage(imageUrl: chatRoom.avatarLink){ (avatarImage) in
        //                self.avatarImageOutlet.image = avatarImage?.circleMasked
        //            }
        //        }else {
        //   self.avatarImageOutlet.image = UIImage(named: "user")
   // }
        
        dateLabel.text = timeElapsed(chatRoom.date ?? Date())
    }
   
}
