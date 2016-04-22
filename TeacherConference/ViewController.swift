//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//  
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var studentInfo = Student()
    var parentInfo = Parent()
    var teacherInfo = Teacher()


    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func goToNextViewController(sender: UIButton) {
    parentInfo.parentName == parentNameTextField.text
    parentInfo.parentEmail == emailTextField.text
    parentInfo.parentPhoneNumber == Int(phoneNumberTextField.text!)!
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ScheduleViewController
        NVC.studentInfo2 = studentInfo
        NVC.parentInfo2 = parentInfo
        NVC.teacherInfo2 = teacherInfo
    }

}