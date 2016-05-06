//
//  ClassInfoViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/22/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ClassInfoViewController: UIViewController {

    var studentInfo3 = Student()
    var parentInfo3 = Parent()
    var teacherInfo3 = Teacher()
    var classInfo = Classes()
    
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teacherNameLabel.text = "Teacher's name: \(teacherInfo3.teacherName)"
        courseNameLabel.text = "Course: \(classInfo.class1)"
        schoolLabel.text = "School: \(teacherInfo3.teacherSchool)"
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! TimesViewController
        NVC.studentInfo4 = studentInfo3
        NVC.parentInfo4 = parentInfo3
        NVC.teacherInfo4 = teacherInfo3
        NVC.classInfo = classInfo
    }
    
}
