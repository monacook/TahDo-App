//
//  ViewController.swift
//  MessagingApp2
//
//  Created by Mona Cook on 5/1/17.
//  Copyright © 2017 Mona Cook. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    
    
    @IBOutlet weak var signInLabel: UILabel!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        // Flip the Boolean
        isSignIn = !isSignIn
        
        // Check the bool and set the button and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        // Do some form validation on the email and password
        
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            
            // Check if it's sign in or register
            if isSignIn {
                // Sign in the user with Firebase
                FIRAuth.auth()?.signIn(withEmail: email, password: pass,
                    completion: { (user, error) in
                        
                    // Check that user isn't nil
                        if user != nil {
                            // User is found, go to home screen 
                            // sender : who is performing or segue to which is viewcontroller
                            self.performSegue(withIdentifier: "goToHome", sender: self)
                        }
                        else {
                            //Error: check error and show message
                        }
                })
        }
        else {
            // Register in the user with Firebase
            
            FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                
                // Check that user isn't nil
                if user != nil {
                    // User is found, go to home screen
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    
                }
                else {
                    
                }
            })
        }
        
            
        }
    }
    
    
}

