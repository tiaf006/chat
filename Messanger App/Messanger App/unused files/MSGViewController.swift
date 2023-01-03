//
//  MSGViewController.swift
//  Messanger App
//
//  Created by Shatha on 10/06/1444 AH.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import RealmSwift

class MSGViewController: MessagesViewController {
    
    //MARK:- vars
    
    private var chatId = ""
    private var recipientId = ""
    private var recipientName = ""
    
    
    //MARK:- int
    
    init (chatId: String , recipientId: String ,recipientName: String ){
        super.init(nibName: nil, bundle: nil)
        
        self.chatId = chatId
        self.recipientId = recipientId
        self.recipientName = recipientName
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
