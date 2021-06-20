//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Kevin Silva on 18/06/21.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int = 0
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters:Bool
    
    var passwords: [String] = []

    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%()_-+=|}]{[':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters:Bool)
    {
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.useSpecialCharacters = useSpecialCharacters
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.numberOfCharacters = numchars
        
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe +=  letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
    
        let universeArray = Array(universe)
        while passwords.count < total {
            for _ in 1...numberOfCharacters {
                var password = ""
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
        }
        
        
        return passwords
    }
    
}
