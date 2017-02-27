//
//  ViewController.swift
//  FbLogin
//
//  Created by Rajat Dhasmana on 27/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(FBSDKAccessToken.current() == nil) {
            
            print("NOT LOGGED IN")
        }
        
        else {
            
            print("LOGGED IN")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile" , "email" , "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error == nil {
            
            print("login complete")
        }
        
        else {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {

        print("user logout")
    
    }
    
    
}
    

