//
//  AddExpenseViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 26.07.2024.
//

import UIKit
import Firebase
import FirebaseFirestore

// AddExpenseViewController, yeni bir harcama eklemek için kullanıcı arayüzünü ve işlevleri içeren sınıf
class AddExpenseViewController: UIViewController {
    
    // Kullanıcıdan harcama miktarını almak için kullanılan UITextField
    @IBOutlet weak var amountTextField: UITextField!
    // Kullanıcıdan harcama açıklamasını almak için kullanılan UITextField
    @IBOutlet weak var descriptionTextField: UITextField!
    // Kullanıcıdan harcamanın kim tarafından ödendiğini almak için kullanılan UITextField
    @IBOutlet weak var paidByTextField: UITextField!
    
    // Hesap kimliği, hangi hesaba harcama ekleneceğini belirtir
        var accountId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Kullanıcı "Add Expense" butonuna tıkladığında çağrılan fonksiyon
    @IBAction func addExpenseTapped(_ sender: UIButton) {
        // Gerekli alanların dolu olup olmadığını kontrol eder
              guard let accountId = accountId,
                    let amountText = amountTextField.text, let amount = Double(amountText),
                    let description = descriptionTextField.text, !description.isEmpty,
                    let paidBy = paidByTextField.text, !paidBy.isEmpty else { return }

              // Harcama verilerini bir sözlük (dictionary) içinde toplar
              let expenseData: [String: Any] = [
                  "accountId": accountId,  // Hesap kimliği
                  "amount": amount,  // Harcama miktarı
                  "description": description,  // Harcama açıklaması
                  "date": Timestamp(date: Date()),  // Harcama tarihi
                  "paidBy": paidBy  // Harcamayı ödeyen kişi
              ]

              // Firestore veritabanına yeni bir harcama belgesi ekler
              Firestore.firestore().collection("expenses").addDocument(data: expenseData) { error in
                  if let error = error {
                      // Harcama ekleme sırasında hata olursa, hata mesajını yazdırır
                      print("Error adding expense: \(error.localizedDescription)")
                  } else {
                      // Harcama başarılı bir şekilde eklendiğinde, kullanıcıyı önceki ekrana geri döndürür
                      print("Expense added successfully")
                      self.navigationController?.popViewController(animated: true)
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
