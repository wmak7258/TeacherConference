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
    }
    

}
