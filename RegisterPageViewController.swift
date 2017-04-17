//
//  RegisterPageViewController.swift
//  Login Page Test
//
//  Created by Miles Tucker on 4/15/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userEmailTextfield: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepeatPasswordTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard()
    {
        userRepeatPasswordTextField.resignFirstResponder()
        userEmailTextfield.resignFirstResponder()

        userPasswordTextField.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userRepeatPasswordTextField.resignFirstResponder()
        userEmailTextfield.resignFirstResponder()
        
        userPasswordTextField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: AnyObject)
    {
        let userEmail = userEmailTextfield.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = userRepeatPasswordTextField.text;
        
        
        // Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            
            // Display alert message
            
            alertMessage(userMessage: "All fields are required");
            
            return;
        }
        
        //Check if passwords match
        if(userPassword != userRepeatPassword)
        {
            // Display an alert message
            alertMessage(userMessage: "Passwords do not match");
            return;
            
        }
        
        //store user data
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.set(userRepeatPassword, forKey: "userRepeatPassword");
        UserDefaults.standard.synchronize();
        
            // Display alert message with confirmation.
            var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
                self.dismiss(animated: true, completion:nil);
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
