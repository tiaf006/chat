//
//  UesrsTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import Firebase

class UesrsTableViewController: UIViewController {

    
    @IBOutlet weak var UesrsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        UesrsTable.dataSource = self
        UesrsTable.delegate = self
       // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",   style: .plain, target: self, action: #selector (handleLogout))
        let image = UIImage (systemName: "square.and.pencil")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,style: .plain, target: self, action: #selector (handleNewMessage))
    }
    @objc func handleNewMessage() {
        let newMessTableViewController = NewMesswController()
        self.navigationController?.pushViewController(newMessTableViewController, animated: true)
    }
    
    func loadUserData() {
        
     //   navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector (handleLogout))
    }
    
    
    func showChatController(){
        print("show chat!!!!!!!")
    }
}

extension UesrsTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 90
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        cell.userNameLabel.text = "user name"
        cell.lastMessageLabel.text = "last message"
        cell.unreadCounterLabel.text = "22"
        return cell
    }
    
    
    
}
