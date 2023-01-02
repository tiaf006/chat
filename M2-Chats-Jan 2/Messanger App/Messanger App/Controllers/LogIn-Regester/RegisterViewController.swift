//
//  RegisterViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseStorage

class RegisterViewController: UIViewController, UITextFieldDelegate {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    

    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address..."
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.keyboardType = .emailAddress
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password ..."
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.isSecureTextEntry = true
        return field
    }()
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
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
        imageView.frame(forAlignmentRect: CGRectMake(0,0,100,100))
        imageView.layer.cornerRadius = imageView.frame.width/2.0
        imageView.clipsToBounds = true
        // imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var imageData = Data()
    
    
    @IBOutlet var photoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wwwwwww")
        view.backgroundColor = .white
        addSubViews()
        layOuts()
        
    }
    func addSubViews(){
        emailField.delegate = self
        passwordField.delegate = self
        
        // add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    
    @objc func layOuts(){
        navigationItem.title = "Register"
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:view.topAnchor , constant:120).isActive = true
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        //imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.backgroundColor = .clear
       // imageView.Rouned()
        //imageView.layer.masksToBounds = false
        //imageView.frame(forAlignmentRect: CGRectMake(0, 0, 100, 100))
        // imageView.contentMode = .scaleAspectFill
        // imageView.layer.cornerRadius = 100.0/2.0
        //imageView.clipsToBounds = true
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 44).isActive = true
        firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        firstNameField.borderStyle = .roundedRect
        
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 20).isActive = true
        lastNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lastNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        lastNameField.borderStyle = .roundedRect
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 20).isActive = true
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        emailField.borderStyle = .roundedRect
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        passwordField.borderStyle = .roundedRect
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 43).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func signUp() {
        guard
            let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty,
            let firstName = firstNameField.text, !firstName.isEmpty,
            let lastName = lastNameField.text, !lastName.isEmpty
        else {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            //            print("email or password is invalid")
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
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let profileVC = storyBoard.instantiateViewController(withIdentifier: "profileVC")
            
            self.navigationController?.pushViewController(profileVC, animated: true)
        })
    }
}



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
        let profile = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! ProfileTableViewController
        profile.loadView()
        profile.imageUser.image = selectedImage
        
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

