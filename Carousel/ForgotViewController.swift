//
//  ForgotViewController.swift
//  Carousel
//
//  Created by Hearsay Guest on 10/19/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var forgotText: UIImageView!
    @IBOutlet weak var oneField: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sendImage: UIImageView!
    @IBOutlet weak var sendButton: UIButton!
    
    var sendButtonCenterY: CGFloat!
    var sendImageCenterY: CGFloat!
    
    @IBAction func goBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        sendButtonCenterY = sendButton.center.y
        sendImageCenterY = sendImage.center.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.sendButton.center.y = self.sendButtonCenterY - 220
        self.sendImage.center.y = self.sendImageCenterY - 220
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.sendButton.center.y = self.sendButtonCenterY
        self.sendImage.center.y = self.sendImageCenterY
    }
    
    @IBAction func onSend(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    

}
