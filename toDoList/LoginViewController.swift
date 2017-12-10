//
//  LoginViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController , GIDSignInUIDelegate{

    
    @IBOutlet weak var titleLabel: UILabel!
   // @IBOutlet weak var theLabelError: UILabel!
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pswdTextField: UITextField!
    
    func repeatSignIn(id: String){
        let keyChain = DataService().keyChain
        keyChain.set(id , forKey: "uid")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = DataService().keyChain
        if keyChain.get("uid") != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Navigation") as UIViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login button is tapped");
        guard let email = nameTextField.text,
            email != "",
            let password = pswdTextField.text,
            password != ""
            else {
                AlertController.showAlert(self, title: "Ошибка", messege: "Пожалуйста, заполните все необходимые поля")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            if error == nil {self.repeatSignIn(id: user!.uid)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Navigation") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
            else {
                  //print("Все плохо");
            AlertController.showAlert(self, title: "Ошибка", messege: error!.localizedDescription)
                return
       
                    }
            guard let user = user else {return}
            print(user.email ?? "missing EMAIL")
            print(user.displayName ?? "missing DISPLAY NAME")
            print(user.uid)
           // print("okey")
            self.repeatSignIn(id: user.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Navigation") as UIViewController
            self.present(vc, animated: true, completion: nil)
            
        })
      
    }
 
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        titleLabel?.numberOfLines = 1
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.1
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
