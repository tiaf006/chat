//
//  LogInViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import FirebaseAuth
//import GoogleSignIn

class LoginViewController: UIViewController {
    // if not signed in, show the login screen, allow the user to sign up
   
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "facebookLogo")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let facebookImg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "faceBook!!")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let facebookBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    let googleImg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "google!!")
        imageView.tintColor = .gray
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let googleBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
//        button.addTarget(self, action: #selector(google), for: .touchUpInside)
        return button
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        layOuts()
    }
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."

        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()

    let signButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(signin), for: .touchUpInside)
        return button
    }()


    @objc func addSubViews(){
        view.addSubview(scrollView)
       scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(signButton)
        scrollView.addSubview(facebookBtn)
        scrollView.addSubview(googleBtn)
       // signButton.imageView?.addSubview(II)
    }
    
    @objc func layOuts(){
        navigationItem.title = "Log In"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go To Regiter", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToRegister))
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 16).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -16).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:view.topAnchor , constant:120).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 120).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -120).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        imageView.backgroundColor = .clear
        imageView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 44).isActive = true
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
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 44).isActive = true
        signButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
       
        facebookBtn.setBackgroundImage(facebookImg.image, for: .normal)
        facebookBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookBtn.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 44).isActive = true
        facebookBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        facebookBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        facebookBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        googleBtn.setBackgroundImage(googleImg.image, for: .normal)
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.topAnchor.constraint(equalTo: facebookBtn.bottomAnchor, constant: 20).isActive = true
        googleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        googleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        googleBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
            }

    @objc func signin() {
        guard
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            
            
            
            //            print("email or password is invalid")
            return
        }
        
            if !emailField.isEmail() {
                let alertController = UIAlertController(title: "Error", message: "Please enter correct email", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
                return
            }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error{
                let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }else{
                //            print("sign in user finished")
                //            print(authResult)
                //            print(error)
               
                
                //MARK: - Update - Shatha, Elham
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView")as! UITabBarController
               storyBoard.modalPresentationStyle = .fullScreen
                self.present(storyBoard, animated: true, completion: nil)
    

            }
        }
    }
    
    @objc func goToRegister() {
        let signupVC = RegisterViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
           }
}
