//
//  LoginViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 22.07.2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = usernameTextField.text, let password = passwordTextField.text else {
                   print("Invalid input")
                   return
               }
               
               Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                   if let error = error {
                       print("Error signing in: \(error.localizedDescription)")
                   } else {
                       // Kullanıcı başarıyla giriş yaptığında yapılacak işlemler
                       print("User signed in")
                       // Ana ekranınıza geçiş yapabilirsiniz, örneğin:
//                    Ana ekranı oluşturduğunda ekle
//                       self.performSegue(withIdentifier: "showMainApp", sender: nil)
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
