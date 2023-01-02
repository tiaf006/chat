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
  //  @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unreadCounterLabel: UILabel!
  //  @IBOutlet weak var unreadCounterView: UIView!
    
    
   // override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       // super.init(style: style, reuseIdentifier: reuseIdentifier)
       // self.contentView.isUserInteractionEnabled = false
   // }
    
    //required init?(coder: NSCoder) {
      //  fatalError("init(coder:) has not been implemented")
    //}
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        avatarImageOutlet.RounedSmall()
        avatarImageOutlet.clipsToBounds = true
        avatarImageOutlet.layer.borderWidth = 1
        avatarImageOutlet.layer.borderColor = UIColor.systemGray.cgColor
        
        unreadCounterLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        unreadCounterLabel.widthAnchor.constraint(equalToConstant: 24).isActive = true
        unreadCounterLabel.clipsToBounds = true
        unreadCounterLabel.layer.cornerRadius = 24/2.0        // Initialization code
        // change shap
        // unreadCounterView.layer.cornerRadius = unreadCounterView.frame.width / 2
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
        
      //  dateLabel.text = timeElapsed(chatRoom.date ?? Date())
    }
   
}
