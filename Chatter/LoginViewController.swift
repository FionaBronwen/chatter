//
//  LoginViewController.swift
//  Chatter
//
//  Created by Fiona Thompson on 2/23/17.
//  Copyright © 2017 Fiona Thompson. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUpButtonPressed(_ sender: Any) {
        let user = PFUser()
        user.email = emailTextField.text
        user.password = passwordTextField.text
        user.username = emailTextField.text
        
        
        user.signUpInBackground { (succeeded: Bool, error: Error? ) in
            if let error = error {
                let errorString = error.localizedDescription
                let alertController = UIAlertController(title: "Whoa!", message: errorString, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)

            } else {
                // Hooray! Let them use the app now.
                let alertController = UIAlertController(title: "Success!", message: "User Created", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
    }
    
    @IBAction func onLogInButtonPressed(_ sender: Any) {
        let password = passwordTextField.text
        let username = emailTextField.text
        
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (succeeded:PFUser?, error: Error?) in
            if let error = error {
                let errorString = error.localizedDescription
                let alertController = UIAlertController(title: "Whoa!", message: errorString, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                self.performSegue(withIdentifier: "logInSegue", sender: self)
                
                // Hooray! Let them use the app now.
            }
        }

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
