//
//  EndViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/29/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

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
                //This is where we would put the email part
            })
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)

    }
    

}
