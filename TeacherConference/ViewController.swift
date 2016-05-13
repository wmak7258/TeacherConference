//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class ViewController: UIViewController  {
    
    var studentInfo = Student()
    var parentInfo = Parent()
    var teacherInfo = Teacher()
    var client = SQLClient()
    var connects = true
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ToNextViewController(sender: UIButton) {
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM students Where studentPK = '\(self.studentIdentificationTextField.text!)' ") {
                    results in
                    if results != nil {
                        self.connects = true
                        for table in results as NSArray {
                            for row in table as! NSArray {
                                self.studentInfo.firstName = row.objectForKey("first_name") as! String
                                self.studentInfo.lastName = row.objectForKey("last_name") as! String
                                print(row)
                            }
                        }
                        self.client.disconnect()
                    }
                    else  {
                        self.connects = false
                    }
                }
            }
        }
        button()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ScheduleViewController
        NVC.studentInfo2 = studentInfo
        NVC.parentInfo2 = parentInfo
        NVC.teacherInfo2 = teacherInfo
    }
    func button() {
        if connects == false {
            let alert = UIAlertController(title: "Error", message: "User not found please check the information you enter", preferredStyle: .Alert)
            let retry = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(retry.copy() as! UIAlertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.performSegueWithIdentifier("schedule", sender: nil)
        }
    }
}