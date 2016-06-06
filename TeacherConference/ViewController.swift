//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var studentInfo = Student()
    var parentInfo = Parent()
    var teacherInfo = Teacher()
    var client = SQLClient()
    var connects = false
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var schoolPicker: UIPickerView!
    @IBOutlet weak var schoolBackground: UIImageView!
    @IBOutlet weak var schoolLogo: UIImageView!
    @IBOutlet weak var label1: UILabel!
    
    var pickerData = ["John Hersey", "Prospect", "Rolling Meadows", "Buffalo Grove", "Elk Grove", "Wheeling"]
    var logoImage: [UIImage] = [
        UIImage(named: "nanook")!,
        UIImage(named: "Prospect")!,
        UIImage(named: "rollingmeadows")!,
        UIImage(named: "buffalogrove")!,
        UIImage(named: "Elk Grove")!,
        UIImage(named: "wheeling")!
    ]
    var backgroundImage: [UIImage] = [
        UIImage(named: "HerseyBackground")!,
        UIImage(named: "blueback")!,
        UIImage(named: "rollingmeadowsback")!,
        UIImage(named: "blueback")!,
        UIImage(named: "elkback")!,
        UIImage(named: "blueback")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolPicker.dataSource = self
        schoolPicker.delegate = self
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        schoolLogo.image = logoImage[row]
        schoolBackground.image = backgroundImage[row]
    }
    // 122578, James Smith, 8f6197c7d
    @IBAction func ToNextViewController(sender: UIButton) {
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM students Where studentPK = '\(self.studentIdentificationTextField.text!)' ") {
                    results in
                    print(results)
                    for table in results as NSArray {
                        for row in table as! NSArray {
                            self.studentInfo.firstName = row.objectForKey("first_name") as! String
                            self.studentInfo.lastName = row.objectForKey("last_name") as! String
                            self.studentInfo.password = row.objectForKey("password") as! String
                            self.studentInfo.email = row.objectForKey("email_ID") as! String
                            self.studentInfo.ID = row.objectForKey("studentPK") as! String
                            print(self.studentInfo.ID)
                            if self.studentIdentificationTextField.text == "" {
                                self.presentAlert()
                                self.clearTextFields()
                            }
                            if self.firstNameTextField.text == self.studentInfo.firstName {
                                self.connects = true
                            } else {
                                self.presentAlert()
                                self.clearTextFields()
                            }
                            if self.lastNameTextField.text == self.studentInfo.lastName {
                                self.connects = true
                            } else {
                                self.presentAlert()
                                self.clearTextFields()
                            }
                            if self.passwordTextField.text == self.studentInfo.password {
                                self.connects = true
                            } else {
                                self.presentAlert()
                                self.clearTextFields()
                            }
                            if self.studentInfo.ID == ""{
                                self.presentAlert()
                                self.clearTextFields()
                            }
                            if self.connects == true {
                                self.performSegueWithIdentifier("schedule", sender: nil)
                                self.clearTextFields()
                            }
                        }
                    }
                }
            }
        }
        parentInfo.parentName = parentNameTextField.text!
        parentInfo.parentEmail = emailTextField.text!
    }
    
    func presentAlert()
    {
        let alert = UIAlertController(title: "Error", message: "User not found please check the information you enter", preferredStyle: .Alert)
        let retry = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(retry)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func clearTextFields()
    {
        passwordTextField.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        studentIdentificationTextField.text = ""
        parentNameTextField.text = ""
        emailTextField.text = ""
        phoneNumberTextField.text = ""
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ScheduleViewController
        NVC.studentInfo2 = studentInfo
        NVC.parentInfo2 = parentInfo
        NVC.teacherInfo2 = teacherInfo
        NVC.studentPK = studentIdentificationTextField.text!
    }
    
}