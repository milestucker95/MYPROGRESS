//
//  LoginViewController.swift
//  Login Page Test
//
//  Created by Miles Tucker on 4/16/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextBox: UITextField!
    @IBOutlet weak var userPasswordTextBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func dismissKeyboard()
    {
        //userRepeatPasswordTextField.resignFirstResponder()
        userEmailTextBox.resignFirstResponder()
        
        userPasswordTextBox.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //userRepeatPasswordTextField.resignFirstResponder()
        userEmailTextBox.resignFirstResponder()
        
        userPasswordTextBox.resignFirstResponder()
        return true
    }

    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        
        //Assign email and password to the text in the textfields
        let userEmail = userEmailTextBox.text;
        let userPassword = userPasswordTextBox.text;
        
        //Stored email and password
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
       
        if(userEmailStored == userEmail)
        {
            if(userPasswordStored == userPassword)
            {
                // Login is successfull
                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                
               // self.dismiss(animated: true, completion: nil);
                self.performSegue(withIdentifier: "LoginToHomeScreen", sender: self)
               // print (userEmailStored)
                //print (userPasswordStored)
            }
        }
        
  
        
        // Display alert message with confirmation.
        var myAlert = UIAlertController(title:"Alert", message:"Login information is invalid", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
           // self.dismiss(animated: true, completion:nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
        
        
        
        

        
        
    }
    
    
    
    func alertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title:"alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
