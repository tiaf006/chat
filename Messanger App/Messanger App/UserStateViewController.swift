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
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
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
               // let profileVC = ProfileViewController()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        //        Auth.auth().removeStateDidChangeListener(handle)
    }
}
