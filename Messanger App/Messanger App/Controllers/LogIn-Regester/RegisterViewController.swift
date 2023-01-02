//
//  RegisterViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class RegisterViewController: UIViewController, UITextFieldDelegate {
    //MARK: UIComponent
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.clipsToBounds = true
        return contentView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address..."
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.keyboardType = .emailAddress
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password ..."
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.isSecureTextEntry = true
        return field
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name"
        field.backgroundColor = .white
        field.keyboardType = .alphabet
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.keyboardType = .alphabet
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 5
        imageView.tintColor = .gray
        //imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = false
        //imageView.frame(forAlignmentRect: CGRectMake(0,0,100,100))
        //imageView.layer.cornerRadius = imageView.frame.width/2.0
        imageView.clipsToBounds = true
        // imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: vars
    var imageData = Data()
    
    //MARK: app lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubViews()
        layOuts()
    }
    
    func addSubViews(){
        emailField.delegate = self
        passwordField.delegate = self
        
        // add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(firstNameField)
        contentView.addSubview(lastNameField)
        contentView.addSubview(emailField)
        contentView.addSubview(passwordField)
        contentView.addSubview(registerButton)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        
        imageView.addGestureRecognizer(gesture)
    }
    
    
    
    @objc func layOuts(){
        navigationItem.title = "Register"
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: 600)
        scrollView.frame = view.frame
        
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.frame.size.height = view.frame.size.height + 200
        contentView.frame.size.width = view.frame.size.width
        contentView.sizeToFit()
        contentView.widthAnchor.constraint(greaterThanOrEqualTo:  scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(greaterThanOrEqualTo:  scrollView.heightAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:contentView.topAnchor , constant:80).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.backgroundColor = .clear
        imageView.Rouned()
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 44).isActive = true
        firstNameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstNameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        firstNameField.borderStyle = .roundedRect
        
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 20).isActive = true
        lastNameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        lastNameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        lastNameField.borderStyle = .roundedRect
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 20).isActive = true
        emailField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        emailField.borderStyle = .roundedRect
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        passwordField.borderStyle = .roundedRect
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 43).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    
    @objc func signUp() {
        guard
            let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty,
            let firstName = firstNameField.text, !firstName.isEmpty,
            let lastName = lastNameField.text , !lastName.isEmpty
                
        else {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            
            return
        }
        if !emailField.isEmail(){
            let alertController = UIAlertController(title: "Error", message: "Please enter correct email", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            return
        }
        if password.count < 6 {
            let alertController = UIAlertController(title: "Error", message: "The password must be 6 characters or more", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(authResult, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
                return
            }
            
            let uid = authResult!.user.uid
            let db = Firestore.firestore()
            
            db.collection("Users").document(uid).setData([
                "First name": self.firstNameField.text!,
                "Last name": self.lastNameField.text!,
                "Email": self.emailField.text!
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            let ref = Database.database().reference(fromURL: "https://messangerapp-5af6b-default-rtdb.firebaseio.com/")
            let usersRef =  ref.child("Uesrs").child(authResult!.user.uid)
            let values: [String: String] = ["name": "\(firstName) \(lastName)", "email": email]
            usersRef.updateChildValues(values, withCompletionBlock: {(err, usersRef)in
                if err != nil {
                    print(err)
                    return
                }
                print("Save user succeddfully into Firebase db") }
            )
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! UIViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.hidesBackButton = true
        })
        
        // }
        
        //  }
        
        
        /*
         
         Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
         //Auth.auth().createUser(withEmail: email, password: password, completion:{( authResult, error) in
         //createUser(withEmail: email, password: password, completion:
         //{(authResult, error: Error?) in
         
         
         if error != nil {
         print (error)
         return
         }
         guard authResult!.user.uid != nil else {
         return
         }
         
         // successfully authenticated user
         let imageName = NSUUID().UUIDString
         let storageRef =
         Storage.storage().reference().child("images").child("\(imageName).png")
         if let uploadData = UIImagePNGRepresentation(self.imageView.image!) {
         storageRef.putData(uploadData, metadata: nil, completion:
         //   { (metadata, error) in
         if error != nil {
         print(error)
         return
         }
         if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
         let values = ["name": "\(firstName) \(lastName)", "email": email,
         "profileImageUrl": profileImageUrl]
         self.registerUserIntoDatabaseWithUID (authResult, values:values)
         }
         })
         }*/
    }
    
}

/* private func registerUserIntoDatabaseWithUID(authResult: AuthDataResult?, values:[String: AnyObject]) {
 let ref = Database.database().reference(fromURL: "https://messangerapp-5af6b-default-rtdb.firebaseio.com/")
 let usersRef =  ref.child("Uesrs").child(authResult!.user.uid)
 // let values: [String: String] = ["name": "\(firstName) \(lastName)", "email": email]
 usersRef.updateChildValues(values, withCompletionBlock: {(err, usersRef)in
 if err != nil {
 print(err)
 return
 }
 print("Save user succeddfully into Firebase db") }
 )
 }
 }*/

/* if !emailField.isEmail(){
 let alertController = UIAlertController(title: "Error", message: "Please enter correct email", preferredStyle: .alert)
 let okAction = UIAlertAction(title: "Ok", style: .cancel)
 alertController.addAction(okAction)
 self.present(alertController, animated: true)
 return
 }
 if password.count < 6 {
 let alertController = UIAlertController(title: "Error", message: "The password must be 6 characters or more", preferredStyle: .alert)
 let okAction = UIAlertAction(title: "Ok", style: .cancel)
 alertController.addAction(okAction)
 self.present(alertController, animated: true)
 return
 }
 
 Auth.auth().createUser(withEmail: email, password: password, completion: {(authResult, error: Error?) in
 if error != nil {
 let alertController = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
 let okAction = UIAlertAction(title: "Ok", style: .cancel)
 alertController.addAction(okAction)
 self.present(alertController, animated: true)
 return
 }
 
 
 let uid = authResult!.user.uid
 let db = Firestore.firestore()
 
 db.collection("Users").document(uid).setData([
 "First name": self.firstNameField.text!,
 "Last name": self.lastNameField.text!,
 "Email": self.emailField.text!
 ]) { err in
 if let err = err {
 print("Error writing document: \(err)")
 } else {
 print("Document successfully written!")
 }
 }
 let ref = Database.database().reference(fromURL: "https://messangerapp-5af6b-default-rtdb.firebaseio.com/")
 let usersRef =  ref.child("Uesrs").child(authResult!.user.uid)
 let values: [String: String] = ["name": "\(firstName) \(lastName)", "email": email]
 usersRef.updateChildValues(values, withCompletionBlock: {(err, usersRef)in
 if err != nil {
 print(err)
 return
 }
 print("Save user succeddfully into Firebase db") }
 )
 let storyBoard = UIStoryboard(name: "Main", bundle: nil)
 let profileVC = storyBoard.instantiateViewController(withIdentifier: "profileVC")
 
 self.navigationController?.pushViewController(profileVC, animated: true)
 })
 */
// }

//  }



//MARK: extention for the emage picker
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoActionSheet(){
        
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self]  _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Chose Photo ",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //MARK: - Image picker methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        print(info)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.imageView.image = selectedImage
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        profile.loadView()
        profile.profileImage.image = selectedImage
        
        let storageRef = Storage.storage().reference()
        imageData = selectedImage.jpegData(compressionQuality: 0.8)!
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        guard imageData != nil else{
            return
        }
        
        let path = "images/\(uid).jpg"
        let fileRef = storageRef.child(path)
        
        let uploadTask = fileRef.putData(imageData, metadata: nil) { metadate, error in
            if error == nil && metadate != nil{
                //                let db = Firestore.firestore()
                //                db.collection("Users").document(uid).setData(["url": path])
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}


// final - cannot be subclassed
final class DatabaseManger {
    
    static let shared = DatabaseManger()
    
    // reference the database below
    
    private let database = Database.database().reference()
    // create a simple write function
    
    
    public func test() {
        // NoSQL - JSON (keys and objects)
        // child refers to a key that we want to write data to
        // in JSON, we can point it to anything that JSON supports - String, another object
        // for users, we might want a key that is the user's email address
        
        database.child("foo").setValue(["something":true])
    }
}

// MARK: - account management
extension DatabaseManger {
    
    // have a completion handler because the function to get data out of the database is asynchrounous so we need a completion block
    
    
    public func userExists(with email:String, completion: @escaping ((Bool) -> Void)) {
        // will return true if the user email does not exist
        
        // firebase allows you to observe value changes on any entry in your NoSQL database by specifying the child you want to observe for, and what type of observation you want
        // let's observe a single event (query the database once)
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value) { snapshot in
            // snapshot has a value property that can be optional if it doesn't exist
            
            guard snapshot.value as? String != nil else {
                // otherwise... let's create the account
                completion(false)
                return
            }
            
            // if we are able to do this, that means the email exists already!
            
            completion(true) // the caller knows the email exists already
        }
    }
    
    /// Insert new user to database
    public func insertUser(with user: ChatAppUser){
        
        database.child(user.safeEmail).setValue(["first_name":user.firstName,"last_name":user.lastName]
        )
    }
}
struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    //let profilePictureUrl: String
    
    // create a computed property safe email
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}

