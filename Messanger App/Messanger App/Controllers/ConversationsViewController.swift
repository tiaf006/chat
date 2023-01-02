//
//  ConversationsViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
        // check to see if user is signed in using ... user defaults
        // they are, stay on the screen. If not, show the login screen
        override func viewDidLoad() {
            super.viewDidLoad()
        
            do {
                try FirebaseAuth.Auth.auth().signOut()
            }
            catch {
            }
            DatabaseManger.shared.test()
        }
    
    
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            validateAuth()
            
            let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
            if !isLoggedIn {
                // present login view controller
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }
        }
    
    private func validateAuth(){
        // current user is set automatically when you log a user in
        if FirebaseAuth.Auth.auth().currentUser == nil {
            // present login view controller
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
        
    }
    }

