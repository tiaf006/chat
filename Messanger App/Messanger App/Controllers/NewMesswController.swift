//
//  newMessTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import Firebase

class NewMesswController: UIViewController {
    let tableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    var users = [Users] ()
    
    let searchUsersField: UITextField = {
        let field = UITextField()
        field.placeholder = "search for user..."
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.keyboardType = .alphabet
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCanel))
        layOuts()
        fetchUser()
    }
    
    func layOuts(){
        navigationItem.title = "search"
        view.addSubview(tableView)
        view.addSubview(searchUsersField)
        
        searchUsersField.translatesAutoresizingMaskIntoConstraints = false
        searchUsersField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        searchUsersField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        searchUsersField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        searchUsersField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        self.tableView.register(searchUserCell.self, forCellReuseIdentifier: "searchCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchUsersField.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.reloadData()
    }
    
    func fetchUser() {
        Database.database().reference().child("Uesrs").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = Users()
                user.id = snapshot.key
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                self.users.append(user)
                self.tableView.reloadData()
                print ("!!!!!!!\(user.name), \(user.email)!!!!")
            }
        }, withCancel: nil)
    }
    
    @objc func handelCanel() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewMesswController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.rowHeight = 60
              return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! searchUserCell
               cell.isUserInteractionEnabled = true
               let user = users[indexPath.row]
               cell.nameLbl.text = user.name
               cell.emailLbl.text = user.email
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stroryBBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryBBoard.instantiateViewController(withIdentifier: "Chats") as! UesrsTableViewController
        vc.loadView()
        vc.showChatController()
        print("Dismiss completed")
        //dismiss (animated: true)
        self.navigationController?.popViewController(animated: true)
        }
    }
   
