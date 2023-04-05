//
//  LoginViewController.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 05/04/23.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let request = RequestLogin()
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btToEnter(_ sender: Any) {
        let email = txtFieldEmail.text ?? ""
        let password = txtFieldPassword.text ?? ""
        request.requestLogin(email: email, password: password) {sucess in
            if sucess {
                self.goToHomeViewController()
            } else {
                self.errorMessage()
            }
        }
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: "Error", message: "Erro no login", preferredStyle: .alert)
        let btOk = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(btOk)
        self.present(alert, animated: true)
    }
    
    func goToHomeViewController() {
        if let screenHome = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController {
            self.present(screenHome, animated: true)
        }
    }
}
