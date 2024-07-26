//
//  CreateAccountViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 26.07.2024.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var accountNameTextField: UITextField!
    
    var selectedAccountId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        guard let accountName = accountNameTextField.text, !accountName.isEmpty else { return }
              guard let userId = Auth.auth().currentUser?.uid else { return }
              
              let accountData: [String: Any] = [
                  "accountName": accountName,
                  "members": [userId]
              ]
              
              Firestore.firestore().collection("accounts").addDocument(data: accountData) { error in
                  if let error = error {
                      print("Error creating account: \(error.localizedDescription)")
                  } else {
                      print("Account created successfully")
                      self.fetchAccountId(accountName: accountName)
                  }
              }
          }
          
          func fetchAccountId(accountName: String) {
              Firestore.firestore().collection("accounts").whereField("accountName", isEqualTo: accountName).getDocuments { (querySnapshot, error) in
                  if let error = error {
                      print("Error fetching account ID: \(error.localizedDescription)")
                  } else {
                      if let document = querySnapshot?.documents.first {
                          self.selectedAccountId = document.documentID
                          self.performSegue(withIdentifier: "goToExpenses", sender: self)
                      }
                  }
              }
          }
          
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "goToExpenses" {
                  if let destinationVC = segue.destination as? ExpensesViewController {
                      destinationVC.accountId = self.selectedAccountId
                  }
              }
          }
      }
