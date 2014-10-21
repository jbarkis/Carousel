//
//  LoginViewController.swift
//  Carousel
//
//  Created by Hearsay Guest on 10/18/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var loginForm: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var loginText: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var forgotButton: UIButton!
    

    var loginFormCenterY: CGFloat!
    var emailFieldCenterY: CGFloat!
    var pwFieldCenterY: CGFloat!
    var loginTextCenterY: CGFloat!
    var loginButtonCenterY: CGFloat!
    var loginImageCenterY: CGFloat!
    var forgotButtonCenterY: CGFloat!

//    var alertView = UIAlertView(title: "Title", message: "Message", delegate: self, cancelButtonTitle: "OK")
//    alertView.show()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        loginFormCenterY = loginForm.center.y
        emailFieldCenterY = emailField.center.y
        pwFieldCenterY = pwField.center.y
        loginTextCenterY = loginText.center.y
        loginButtonCenterY = loginButton.center.y
        loginImageCenterY = loginImage.center.y
        forgotButtonCenterY = forgotButton.center.y
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.loginForm.center.y = self.loginFormCenterY - 80
        self.emailField.center.y = self.emailFieldCenterY - 80
        self.pwField.center.y = self.pwFieldCenterY - 80
        self.loginText.center.y = self.loginTextCenterY - 80
        self.loginImage.center.y = self.loginImageCenterY - 240
        self.loginButton.center.y = self.loginButtonCenterY - 240
        self.forgotButton.center.y = self.forgotButtonCenterY - 240
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.loginForm.center.y = self.loginFormCenterY
        self.emailField.center.y = self.emailFieldCenterY
        self.pwField.center.y = self.pwFieldCenterY
        self.loginText.center.y = self.loginTextCenterY
        self.loginImage.center.y = self.loginImageCenterY
        self.loginButton.center.y = self.loginButtonCenterY
        self.forgotButton.center.y = self.forgotButtonCenterY
    }
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    
    @IBAction func onLogin(sender: AnyObject) {
        if self.emailField.text.isEmpty || self.pwField.text.isEmpty {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else {
            var alertView = UIAlertView(title: "Signing In...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            delay(2) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if self.emailField.text == "po" && self.pwField.text == "qw" {
                    self.performSegueWithIdentifier("loginTutorial", sender: sender)
                }
                else {
                    var alertView = UIAlertView(title: "Incorrect Email/Password", message: "Please make sure your email and password are correct.", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
                
            }
            
        }
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

}
