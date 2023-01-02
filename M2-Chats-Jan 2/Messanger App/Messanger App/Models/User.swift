//
//  User.swift
//  Messanger App
//
//  Created by elham on 1/1/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct User: Codable {
    
    var id = ""
    var username: String
    var email: String
    var pushid = ""
    var avatarLink = ""
    var status: String
    
//        static var currentUser: User? {
//            if Auth.auth().currentUser != nil {
//                if let data = UserDefaults.data( forKey: kCURRENTUSER) {
//                    let decoder = JSONDecoder()
//    
//                    do {
//    
//                        let userObject = try decoder.decode(User.self, from: data)
//    
//                        return userObject
//                    } catch {
//    
//                        print (error.localizedDescription)
//                    }
//                }
//            }
//            return nil
//        }
//    }
//   
    
    
    func saveUserLocally(_ user: User) {
        
        let econder = JSONEncoder()
        
        do {
            let data = try econder.encode(user)
            //
            userDefaults.set(data,forKey: kCURRENTUSER)
            
        } catch {
            print (error.localizedDescription)
        }
    }
    
}
