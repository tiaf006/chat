//
//  UserStateViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 03/06/1444 AH.
//

import UIKit
import FirebaseAuth

class UserStateViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle!
    //check the user state :
    // it will loud the log in view if the user is nill
    // else it will load the tapbar
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if handle != nil { return }
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth status did change")
            print(auth)
            print(user)
            user?.uid
            self.dismiss(animated: true)
            if user != nil {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "MainVC") 
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
                vc.navigationItem.hidesBackButton = true
                
            } else {
                let signinVC = LoginViewController()
                let authenticationNC = UINavigationController(rootViewController: signinVC)
                authenticationNC.modalPresentationStyle = .fullScreen
                self.present(authenticationNC, animated: true)
            }
        }
    }
}
