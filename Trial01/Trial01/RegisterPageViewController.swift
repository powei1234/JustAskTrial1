//
//  RegisterPageViewController.swift
//  Trial01
//
//  Created by Mcgill Chen on 13/06/2017.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
//import Parse


class RegisterPageViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        displayMyAlertMessage(userMessage: "Passwords do not match");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
    
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        // Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            
            // Display alert message
            
            displayMyAlertMessage(userMessage: "All fields are required");
            
            return;
        }
        
        //Check if passwords match
        if(userPassword != userRepeatPassword)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
            
        }
        
        
    
        
        //store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
    UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.set(userRepeatPassword, forKey: "userRepeatPassword");
        
        UserDefaults.standard.synchronize();
        
        
        
        // Display alert message with confirmation.
        let Alert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert);
        
        
     Alert.addAction(UIAlertAction(title:"Cancel", style: .default, handler:{(action) in Alert.dismiss(animated: true, completion: nil);
        
        
        self.present(Alert, animated:true, completion:nil);
        
        
    }))
    
}


    
func displayMyAlertMessage(userMessage:String)
{
    
    let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
    
    
    myAlert.addAction(UIAlertAction(title:"Cancel", style: .default, handler:{(action) in myAlert.dismiss(animated: true, completion: nil);
   
}))
     self.present(myAlert, animated: true, completion:nil)

}
}
