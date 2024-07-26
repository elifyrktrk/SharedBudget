//
//  Expense.swift
//  myProject
//
//  Created by Elif Yürektürk on 26.07.2024.
//

import Foundation
import FirebaseFirestoreSwift

// Expense, harcama verilerini tutan model
struct Expense: Identifiable, Codable {
    @DocumentID var id: String?  // Firestore belgesi ID'si
    var accountId: String  // Hesap kimliği
    var amount: Double  // Harcama miktarı
    var description: String  // Harcama açıklaması
    var date: Date  // Harcama tarihi
    var paidBy: String  // Harcamayı ödeyen kişi
}
