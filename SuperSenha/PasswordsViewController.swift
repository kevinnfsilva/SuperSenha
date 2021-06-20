//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Kevin Silva on 18/06/21.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPassword: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!

    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)

        generatePasswords()
    }
    
    func generatePasswords() {
        tvPassword.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        tvPassword.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPassword.text.append(password + "\n\n")
        }
    }
    
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    


}
