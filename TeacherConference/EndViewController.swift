//
//  EndViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/29/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class EndViewController: UIViewController,MFMailComposeViewControllerDelegate {

    var studentInfo5 = Student()
    var parentInfo5 = Parent()
    var teacherInfo5 = Teacher()
    var timeInfo = Time()
    var classInfo = Classes()
    
    @IBOutlet weak var studentNameTextField: UILabel!
    @IBOutlet weak var parentNameTextField: UILabel!
    @IBOutlet weak var parentEmailTextField: UILabel!
    @IBOutlet weak var teacherNameTextField: UILabel!
    @IBOutlet weak var teacherEmailTextField: UILabel!
    @IBOutlet weak var courseTextField: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentNameTextField.text = studentInfo5.name
        parentNameTextField.text = parentInfo5.parentName
        parentEmailTextField.text = parentInfo5.parentEmail
        teacherNameTextField.text = classInfo.teacher
        teacherEmailTextField.text = teacherInfo5.teacherEmail
        courseTextField.text = classInfo.class1
        timeTextField.text = timeInfo.time
        
    }

    @IBAction func presentAlert(sender: UIButton) {
        let alert = UIAlertController(title: "Are you done?", message: "Are you sure that all this information is correct?", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: {
            action in
            })
        let okAction = UIAlertAction(title: "Yes", style: .Default, handler: {
            action in
            
            let alert = UIAlertController(title: "Email", message: "Do you want to send an email to the teacher?", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: {
                action in
            })
            let okAction = UIAlertAction(title: "Yes", style: .Default, handler: {
                action in
                let mailComposeViewController = self.configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }            })
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([teacherInfo5.teacherEmail])
        mailComposerVC.setSubject("Sent by \(parentInfo5.parentEmail)")
        mailComposerVC.setMessageBody("\(parentInfo5.parentName) has scheduled a conference at \(timeInfo.time) for \(studentInfo5.name)'s \(classInfo.class1). For more ways to contact \(parentInfo5.parentName) his/her email is \(parentInfo5.parentEmail) and his/her phone number is \(parentInfo5.parentPhoneNumber).", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Dissmiss", style: UIAlertActionStyle.Cancel, handler: {
            action in
        })
        sendMailErrorAlert.addAction(cancelAction)
        self.presentViewController(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }


}