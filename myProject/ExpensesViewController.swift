//
//  ExpensesViewController.swift
//  myProject
//
//  Created by Elif Yürektürk on 26.07.2024.
//

import UIKit
import Firebase
import FirebaseFirestore

// ExpensesViewController, harcamaları listeleyen ve yönetim işlevlerini içeren sınıf
class ExpensesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Harcamaları göstermek için kullanılan UITableView
    @IBOutlet weak var tableView: UITableView!
    // Harcama verilerini tutmak için bir dizi
    var expenses: [Expense] = []
    // Hesap kimliği, hangi hesaba ait harcamaların listeleneceğini belirtir
    var accountId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchExpenses()

        // Do any additional setup after loading the view.
    }
    
    // Firestore'dan harcamaları çekmek için kullanılan fonksiyon
    func fetchExpenses() {
            guard let accountId = accountId else { return }

            Firestore.firestore().collection("expenses").whereField("accountId", isEqualTo: accountId).getDocuments { (querySnapshot, error) in
                if let error = error {
                    // Harcamaları çekerken hata olursa, hata mesajını yazdırır
                    print("Error fetching expenses: \(error.localizedDescription)")
                    return
                }

                // Firestore'dan alınan belgeleri Expense modeline dönüştürür ve expenses dizisine ekler
                self.expenses = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Expense.self)
                } ?? []
                self.tableView.reloadData()
            }
        }
    
    // TableView DataSource Methods
        // TableView'da kaç satır olacağını belirtir
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return expenses.count
        }

        // TableView'da her bir hücrede gösterilecek veriyi ayarlar
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath)
            let expense = expenses[indexPath.row]
            cell.textLabel?.text = "\(expense.description) - \(expense.amount) - \(expense.paidBy)"
            return cell
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


