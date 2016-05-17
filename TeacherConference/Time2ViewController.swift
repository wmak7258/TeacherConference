//
//  Time2ViewController.swift
//  TeacherConference
//
//  Created by student1 on 5/17/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class Time2ViewController: UIViewController {

    var studentInfo5 = Student()
    var parentInfo5 = Parent()
    var teacherInfo5 = Teacher()
    var timeInfo = Time()
    var classInfo = Classes()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as EndViewController
        
    }
}
