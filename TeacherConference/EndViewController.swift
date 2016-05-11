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
    @IBAction func printData(sender: UIBarButtonItem) {
        //let fileData = "\(studentNameTextField.text) \(parentNameTextField.text) \(parentEmailTextField.text) \(teacherNameTextField.text) \(teacherEmailTextField.text) \(courseTextField.text) \(timeTextField.text)"
        //if UIPrintInteractionController.canPrintURL(fileData!) {
        // let printJob = UIPrintInfo(dictionary: nil)
        //  printJob.jobName = fileData!.lastPathComponent
        //  printJob.outputType = .Photo
        
        //   let printController = UIPrintInteractionController.sharedPrintController()!
        //   printController.printInfo = printJob
        //   printController.showsNumberOfCopies = false
        
        //   printController.printingItem = fileData
        
        //   printController.presentAnimated(true, completionHandler: nil)
    }


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
            
            let alert = UIAlertController(title: "Email", message: "Do you want to send an email?", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: {
                action in
            })
            let emailTeacherAction = UIAlertAction(title: "To Teacher", style: .Default, handler: {
                action in
                let mailComposeViewController = self.configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }            })
            let emailMeAction = UIAlertAction(title: "To Me", style: .Default, handler: {
                action in
                let mailComposeViewController = self.configuredMailComposeViewController2()
                if MFMailComposeViewController.canSendMail() {
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }            })
            let emailBothAction = UIAlertAction(title: "To both", style: .Default, handler: {
                action in
                let mailComposeViewController = self.configuredMailComposeViewController3()
                if MFMailComposeViewController.canSendMail() {
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }            })
            alert.addAction(emailTeacherAction)
            alert.addAction(emailMeAction)
            alert.addAction(emailBothAction)
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
        mailComposerVC.setSubject("Conference scheduled")
        mailComposerVC.setMessageBody("\(parentInfo5.parentName) has scheduled a conference at \(timeInfo.time) for \(studentInfo5.name)'s \(classInfo.class1). For more ways to contact \(parentInfo5.parentName) his/her email is \(parentInfo5.parentEmail) and his/her phone number is \(parentInfo5.parentPhoneNumber).", isHTML: false)
        
        return mailComposerVC
    }
    func configuredMailComposeViewController2() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([parentInfo5.parentEmail])
        mailComposerVC.setSubject("Conference scheduled")
        mailComposerVC.setMessageBody("You, \(parentInfo5.parentName) have scheduled a conference at \(timeInfo.time) for \(studentInfo5.name)'s \(classInfo.class1) with \(teacherInfo5.teacherName). For more ways to contact \(teacherInfo5.teacherName) his/her email is \(teacherInfo5.teacherEmail).", isHTML: false)
        
        return mailComposerVC
    }
    func configuredMailComposeViewController3() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([parentInfo5.parentEmail])
        mailComposerVC.setToRecipients([teacherInfo5.teacherEmail])
        mailComposerVC.setSubject("Conference scheduled")
        mailComposerVC.setMessageBody("\(parentInfo5.parentName) has scheduled a conference at \(timeInfo.time) for \(studentInfo5.name)'s \(classInfo.class1).", isHTML: false)
        
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
