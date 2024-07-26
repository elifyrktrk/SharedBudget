//
//  HomeViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 26.07.2024.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        do {
                   try Auth.auth().signOut()
                   // Kullanıcı oturumu kapattıktan sonra LoginViewController'a yönlendirin
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                   let navController = UINavigationController(rootViewController: loginViewController)
                   navController.modalPresentationStyle = .fullScreen
                   self.present(navController, animated: true, completion: nil)
               } catch let signOutError as NSError {
                   print("Error signing out: %@", signOutError)
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


