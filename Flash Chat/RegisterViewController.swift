//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        
        
        //TODO: Set up a new user on our Firbase database
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print(error!)
                
                let alert = UIAlertController(title: "Error!", message: "Please enter your email and password min 6 characters.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                //Success
                print("Registraion Successful!")
                
                SVProgressHUD.show()
                
                
                //need self before when ur inside of a closure!
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
                SVProgressHUD.dismiss()
            }
        }

        
        
    } 
    
    
}
