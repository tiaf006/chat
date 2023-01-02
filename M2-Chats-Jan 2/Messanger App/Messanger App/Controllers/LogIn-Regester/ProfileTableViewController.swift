//
//  ProfileViewController.swift
//  Messanger App
//
//  Created by Shatha on 03/06/1444 AH.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileTableViewController: UITableViewController {
    
    //MARK: -Outlet
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       // showUserInfo()
    }
    
    //MARK: - Action
    
    @IBAction func buttonLogout(_ sender: UIButton) {
        // MARK:- shatha
        try! Auth.auth().signOut()
        if let board = self.storyboard {
            let logInView = LoginViewController()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) ->
    UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor (named: "ColorTableView")
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 0.0: 10.0
    }
    
    
//    private func showUserInfo() {
//
//        if let user = User.currentUser {
//            nameLabel.text = user.username
//
//            if user.avatarLink != "" {
//                //TODO: Download and set
//
//            }
//
//        }
//    }
}// end class
 
        //    let photo = RegisterViewController()
        //    var photoData = Data()
        //    override func viewDidLoad() {
        //        super.viewDidLoad()
        //        photoData = photo.imageData
        //        profileImage.image = UIImage(data: photoData)
        //        profileImage.tintColor = .gray
        //        profileImage.layer.cornerRadius = 70
        //        profileImage.contentMode = .scaleAspectFit
        
        
        
        //    @IBAction func logOutAction(_ sender: Any) {
        //        try! Auth.auth().signOut()
        //        if let storyboard = self.storyboard {
        //            let logInView = LoginViewController()
        //            self.navigationController?.popToRootViewController(animated: true)
        //        }
        //    }
        //
        //    extension UIImageView {
        //        func Rouned(){
        //            self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //            self.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //            self.layer.masksToBounds = false
        //            self.frame(forAlignmentRect: CGRectMake(0, 0, 150, 150))
        //            self.contentMode = .scaleAspectFill
        //            self.layer.cornerRadius = 150.0/2.0
        //            self.clipsToBounds = true
        //        }
