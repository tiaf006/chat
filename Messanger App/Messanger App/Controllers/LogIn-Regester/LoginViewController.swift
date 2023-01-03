//
//  LogInViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import FirebaseAuth
import Firebase
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
        return button
    }()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubViews()
        layOuts()
    }
    
    @objc func addSubViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(emailField)
        contentView.addSubview(passwordField)
        contentView.addSubview(signButton)
        contentView.addSubview(facebookBtn)
        contentView.addSubview(googleBtn)
    }
    
    @objc func layOuts(){
        navigationItem.title = "Log In"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go To Regiter", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToRegister))
        
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
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 44).isActive = true
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
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 44).isActive = true
        signButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        signButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        signButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        facebookBtn.setBackgroundImage(facebookImg.image, for: .normal)
        facebookBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookBtn.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 44).isActive = true
        facebookBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        facebookBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        facebookBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        googleBtn.setBackgroundImage(googleImg.image, for: .normal)
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.topAnchor.constraint(equalTo: facebookBtn.bottomAnchor, constant: 20).isActive = true
        googleBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        googleBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        googleBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    // make user log in while checking:
    // the emale is valid and is already regestered in the database and the password matches the email and the fields are not impty
    @objc func signin() {
        guard
            let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty else {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
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
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! UIViewController
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
                vc.navigationItem.hidesBackButton = true
            }
        }
    }
    //navigate to regester page
    @objc func goToRegister() {
        let signupVC = RegisterViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}
