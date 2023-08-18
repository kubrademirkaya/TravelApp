//
//  KeychainHelper.swift
//  PhoneApp
//
//  Created by Kübra Demirkaya on 10.08.2023.
//

//Keycahin şifrelemek istediğimiz verilerin saklanacağı yer
//Küçük ve şifreleme gerektirmeyen veriler için UserDefault, Dic mantığı ile çalışıyor
//Daha büyük boyutta, kaybolma ihtimali çok büyük sorun yaratmayacak veriler local database


import Foundation

final class KeychainHelper {
    
    static let standard = KeychainHelper()
    private init() {}
    
    func save(_ data: Data, service: String, account: String) {
        
        
        // Create query
        let query = [
            kSecValueData: data,
            //Verinin şifrelenmesi
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary
        
        
        let status = SecItemAdd(query, nil)
        
        if status == errSecDuplicateItem {
            // Item already exist, thus update it.
            let query = [
                kSecAttrService: service,
                kSecAttrAccount: account,
                kSecClass: kSecClassGenericPassword,
            ] as CFDictionary
            
            let attributesToUpdate = [kSecValueData: data] as CFDictionary
            
            // Update existing item
            SecItemUpdate(query, attributesToUpdate)
        }
        
        if status != errSecSuccess {
            // Print out the error
            
            print("Error: \(status)")
        }
    }
    
    func read(service: String, account: String) -> Data? {
        
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(service: String, account: String) {
        
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            ] as CFDictionary
        
        // Delete item from keychain
        SecItemDelete(query)
    }
    
}
