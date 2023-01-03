//
//  ChatRoomTableViewController.swift
//  Messanger App
//
//  Created by Shatha on 08/06/1444 AH.
//

import UIKit

class ChatRoomTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // deleat cell
        tableView.tableFooterView = UIView()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
        
        
        let chatRoom = ChatRoom(id: "123" , chatRoomId: "123", senderId:"123" ,senderName:"123" , receiverId:"123" ,receiverName: "shatha",date: Date() ,memberIds: [""],lastMessage:"Hellow shatha, how are you? let's meet tomorrow" ,unreadCounter: 1 ,avatarLink: "")
        
        cell.configure(chatRoom: chatRoom)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       // let chatRoomObject = searchUserCell.isActive ?
        //  filteredChaRooms[indexPath.row] : allChatRooms[indexPath.row]
        
     //   goToMSG(chatRoom: chatRoomObject)
    }
    
    
    private func downloadChatRooms() {
        //FChatRoomListener.shared.downloadChatRooms { (allFBChatRooms) in
     //       self.allChatRooms = allFBChatRooms
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    //MARK: - Navigation
    
    func goToMSG(chatRoom: ChatRoom) {
        
        let privateMSGView = MSGViewController(chatId: chatRoom.chatRoomId, recipientId:
        chatRoom.receiverId, recipientName: chatRoom.receiverName)
        
    //    navigationController?.pushViewController(privateMSGView,animated:true)
    }
    

