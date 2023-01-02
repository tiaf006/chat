//
//  FCollectionReference.swift
//  Messanger App
//
//  Created by elham on 1/1/23.
//

import Foundation
import Firebase


enum FCollectionReference: String {
  case User
}

func FirestoreReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
  
}
