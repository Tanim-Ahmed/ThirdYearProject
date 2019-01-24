//
//  LoginViewController.swift
//  NewsReader1
//
//  Created by cse on 11/8/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        //retrive from database
        
        let storedEmail = UserDefaults.standard.string(forKey: "UserEmail")
        let storedPassword = UserDefaults.standard.string(forKey: "UserPassword")
        
        
        
        //check if match
        if(userEmail == storedEmail)
        {
            if(userPassword == storedPassword)
            {
                //self.displayAlertMessage(userMessage: "Login success")
                
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                self.dismiss(animated: true, completion: nil)
            }
            else {
                //show alert
            }
        }
        //successfull
    }
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    

}
