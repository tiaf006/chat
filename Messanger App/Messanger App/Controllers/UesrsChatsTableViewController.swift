//
//  UesrsTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import Firebase

class UesrsChatsTableViewController: UIViewController {
    @IBOutlet weak var UesrsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chats"
        view.backgroundColor = UIColor.white
        UesrsTable.dataSource = self
        UesrsTable.delegate = self
    }
   //navigate to the chatlog page
    func showChatController(){
        print("show chat!!!!!!!")
        let chatLogController = Chats(collectionViewLayout:
                                        UICollectionViewFlowLayout())
        navigationController?.pushViewController (chatLogController,
                                                  animated: true)
    }
}
extension UesrsChatsTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 90
        return 1
    }
    //create user chats cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        cell.userNameLabel.text = "user name"
        cell.lastMessageLabel.text = "last message"
        cell.unreadCounterLabel.text = "22"
        return cell
    }
}
