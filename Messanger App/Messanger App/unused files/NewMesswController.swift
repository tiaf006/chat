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
    
    let searchController = UISearchController()
    
    var users = [Users] ()
    var filteredUsers = [Users]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredUsers = users
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCanel))
        layOuts()
        fetchUser()
    }
    
    func layOuts(){
        navigationItem.title = "search"
        view.addSubview(tableView)
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        self.tableView.register(searchUserCell.self, forCellReuseIdentifier: "searchCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        tableView.reloadData()
        
        searchController.loadViewIfNeeded()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Search By Email"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func fetchUser() {
        Database.database().reference().child("Uesrs").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = Users()
                user.id = snapshot.key
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                self.users.append(user)
                self.filteredUsers.append(user)
                self.tableView.reloadData()
                print ("!!!!!!!\(String(describing: user.name)), \(String(describing: user.email))!!!!")
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
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! searchUserCell
        cell.isUserInteractionEnabled = true
        let user = filteredUsers[indexPath.row]
        cell.nameLbl.text = user.name
        cell.emailLbl.text = user.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stroryBBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryBBoard.instantiateViewController(withIdentifier: "Chats") as! UesrsChatsTableViewController
        vc.loadView()
        vc.showChatController()
        print("Dismiss completed")
        self.navigationController?.popViewController(animated: true)
    }
}
extension NewMesswController: UISearchBarDelegate{
    
    func initSearchController(){
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(filteredUsers)
        if !searchText.isEmpty{
            print("whyy")
            filteredUsers = []
            for user in users{
                if user.email!.uppercased().contains(searchText.uppercased()){
                    filteredUsers.append(user)
                    tableView.reloadData()
                    print(filteredUsers)
                    print((user.email!))
                }
            }
        }
    }
}
