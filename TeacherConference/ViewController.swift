//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//  
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class ViewController: UIViewController {

    var studentInfo = Student()
    var parentInfo = Parent()
    var teacherInfo = Teacher()
    var client = SQLClient()

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM students Where studentPK = '\(self.studentIdentificationTextField))' ") {
                    results in
                    
                    for table in results as NSArray {
                        for row in table as! NSArray {
                            for column in row as! NSDictionary {
                                print(column)
                            }
                        }
                    }
                    
                    self.client.disconnect()
                }
            }
        }

    }
    
    @IBAction func goToNextViewController(sender: UIButton) {
    studentInfo.name = studentNameTextField.text!
    parentInfo.parentName = parentNameTextField.text!
    parentInfo.parentEmail = emailTextField.text!
    print(parentInfo.parentPhoneNumber)
    parentInfo.parentPhoneNumber = Int(phoneNumberTextField.text!)!
    print(parentInfo.parentPhoneNumber)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ScheduleViewController
        NVC.studentInfo2 = studentInfo
        NVC.parentInfo2 = parentInfo
        NVC.teacherInfo2 = teacherInfo
    }

}