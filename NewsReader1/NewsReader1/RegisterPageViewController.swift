//
//  RegisterPageViewController.swift
//  NewsReader1
//
//  Created by cse on 11/8/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let email = userEmailTextField.text
        let password=userPasswordTextField.text
        let confirm=repeatPasswordTextField.text
        
        if((email ?? "").isEmpty || (password ?? "").isEmpty || (confirm ?? "").isEmpty){
            displayAlertMessage(userMessage: "All fields are required!")
            return
        }
        if(password != confirm){
            displayAlertMessage(userMessage: "password not match!")
            return
        }
        
        //storeData
        UserDefaults.standard.set(email, forKey: "UserEmail")
        UserDefaults.standard.set(password, forKey: "UserPassword")
        
        //successfull
        let alert = UIAlertController(title: "Hi!", message: "Registration Successfull", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in self.dismiss(animated: true, completion: nil)})
        
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
        
    }
    
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    

   

}
