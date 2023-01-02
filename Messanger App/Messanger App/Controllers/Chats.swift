//
//  Chats.swift
//  Messanger App
//
//  Created by Eman on 07/06/1444 AH.
//

import UIKit
import Firebase

class Chats: UICollectionViewController, UITextFieldDelegate {
  
    var user : Users?{
        didSet{
            navigationItem.title = user?.name
        }
    }
    
    lazy var textMessage: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.white
        
        setUpInput()
    }
    
   func setUpInput(){
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(container)
        
        container.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        container.addSubview(sendButton)
        sendButton.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true

        
        container.addSubview(textMessage)
        textMessage.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 8).isActive = true
        textMessage.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        textMessage.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        textMessage.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
        
        let line = UIView()
        line.backgroundColor = UIColor.gray
        line.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(line)
        line.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    @objc func sendMessage(){
        
        let ref = Database.database().reference().child("message")
        let childRef = ref.childByAutoId()
        let users = user!.id!
        let secondUserId = Auth.auth().currentUser?.uid
        let times : NSNumber = Int(NSDate().timeIntervalSince1970) as NSNumber
        let values = ["text": textMessage.text!, "name": users, "from": secondUserId, "time": time] as [String : Any]
        
               ref.updateChildValues(values)
        childRef.updateChildValues(values){(error, ref) in
            if error != nil {
                print(error)
                return
            }
        }
        
        let userMessageRef = Database.database().reference().child("userMessage").child(secondUserId!)
        
        let messageId = childRef.key
        userMessageRef.updateChildValues([messageId: 1])
        
        let recipientUserMessageRef = Database.database().reference().child("userMessage").child(users)
        recipientUserMessageRef.updateChildValues([messageId: 1])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    } 
}
