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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! TimesViewController
        NVC.studentInfo4 = studentInfo3
        NVC.parentInfo4 = parentInfo3
        NVC.teacherInfo4 = teacherInfo3
        NVC.classInfo = classInfo
    }
    
}
