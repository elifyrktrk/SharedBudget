//
//  SignUpViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 22.07.2024.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButtonTapped(_ sender: UIButton) { 
        guard let email = usernameTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
            print("Invalid input")
            return
        }
        
        if password != confirmPassword {
            print("Passwords do not match")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                if let errorCode = AuthErrorCode(rawValue: error.code) {
                    switch errorCode {
                    case .emailAlreadyInUse:
                        print("The email address is already in use by another account.")
                    case .invalidEmail:
                        print("The email address is badly formatted.")
                    case .weakPassword:
                        print("The password must be 6 characters long or more.")
                    default:
                        print("Error: \(error.localizedDescription)")
                    }
                } else {
                    // Kullanıcı başarıyla oluşturulduğunda yapılacak işlemler
                    print("User created")
                    
                    //                   self.performSegue(withIdentifier: "showMainApp", sender: nil)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
