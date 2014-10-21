//
//  CreateViewController.swift
//  Carousel
//
//  Created by Hearsay Guest on 10/19/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createText: UIImageView!
    @IBOutlet weak var createForm: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var repwField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var createImage: UIImageView!
    @IBOutlet weak var termsText: UIImageView!
    @IBOutlet weak var termsBox: UIButton!
    
    var createTextCY: CGFloat!
    var createFormCY: CGFloat!
    var nameFieldCY: CGFloat!
    var emailFieldCY: CGFloat!
    var pwFieldCY: CGFloat!
    var repwFieldCY: CGFloat!
    var createButtonCY: CGFloat!
    var createImageCY: CGFloat!
    var termsTextCY: CGFloat!
    var termsBoxCY: CGFloat!

    var termsBoxChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.termsBoxChecked = false

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        createTextCY = createText.center.y
        createFormCY = createForm.center.y
        nameFieldCY = nameField.center.y
        emailFieldCY = emailField.center.y
        pwFieldCY = pwField.center.y
        repwFieldCY = repwField.center.y
        createButtonCY = createButton.center.y
        createImageCY = createImage.center.y
        termsTextCY = termsText.center.y
        termsBoxCY = termsBox.center.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        self.createText.center.y = createTextCY - 80
        self.createForm.center.y = createFormCY - 80
        self.nameField.center.y = nameFieldCY - 80
        self.emailField.center.y = emailFieldCY - 80
        self.pwField.center.y = pwFieldCY - 80
        self.repwField.center.y = repwFieldCY - 80
        self.createButton.center.y = createButtonCY - 160
        self.createImage.center.y = createImageCY - 160
        self.termsText.center.y = termsTextCY - 160
        self.termsBox.center.y = termsBoxCY - 160
    }
    
    func keyboardWillHide(notification: NSNotification!) {
            self.createText.center.y = createTextCY
            self.createForm.center.y = createFormCY
            self.nameField.center.y = nameFieldCY
            self.emailField.center.y = emailFieldCY
            self.pwField.center.y = pwFieldCY
            self.repwField.center.y = repwFieldCY
            self.createButton.center.y = createButtonCY
            self.createImage.center.y = createImageCY
            self.termsText.center.y = termsTextCY
            self.termsBox.center.y = termsBoxCY
    }

    @IBAction func onTermsSelect(sender: UIButton) {
        self.termsBoxChecked = !self.termsBoxChecked
        
        if (self.termsBoxChecked) {
            self.termsBox.setImage(UIImage(named: "check_box_selected"), forState: UIControlState.Normal)
        }
        else {
             self.termsBox.setImage(UIImage(named: "check_box"), forState: UIControlState.Normal)
        }
    }
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
            view.endEditing(true)
    }
    
    

    

}
