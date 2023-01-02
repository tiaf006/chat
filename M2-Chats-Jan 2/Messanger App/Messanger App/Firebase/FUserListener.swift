//
//  FUserListener.swift
//  Messanger App
//
//  Created by elham on 1/1/23.
//

import Foundation
import Firebase

class FUserListener {
    
    static let shared = FUserListener()
    
    private init() {}
    
    
    
    //MARK: - Login
    
    
    
    
    
    //MARK: - Register
    
    func registerUserWith (email: String, password: String, completion: @escaping (_ error: Error? )-> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResults, error) in
            
            completion(error)
            
            if error == nil {
                
                authResults!.user.sendEmailVerification { (error) in
                    
                   completion(error)
                }
            }
            
            if authResults?.user != nil {
                let user = User(id: authResults!.user.uid, username: email, email: email, pushid: "", avatarLink: "", status: "Hey, I'm using Dardesh")
                
                
              //saveUserToFirestore(user)
                saveUserToFirestore(user)
               // saveUserLocally(user)
            }
        }
    }
    
    private func saveUserToFirestore(_ user: User) {
        
        do {
            try FirestoreReference(.User).document(user.id).setData(from: user)
        } catch {
            print (error.localizedDescription)
        }
        
        
        
    }
}
