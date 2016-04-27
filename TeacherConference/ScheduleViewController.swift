//
//  ScheduleViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentInfo2 = Student()
    var parentInfo2 = Parent()
    var teacherInfo2 = Teacher()
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let teacherInfo :Dictionary <String,String> = ["Teacher Name": "\(teacherInfo2).teacherName)", "Class": "\(teacherInfo2.classes)", "Room Number": "\(teacherInfo2.roomNumber)", "Time": "\(teacherInfo2.time)", "Teacher E-Mail": "\(teacherInfo2.teacherEmail)", "TeacherID": "\(teacherInfo2.teacherID)", "Teacher School": "\(teacherInfo2.teacherSchool)"]
        let parent :Dictionary <String,String> = ["Parent Name": "\(parentInfo2.parentName)", "Parent E-Mail": "\(parentInfo2.parentEmail)", "Parent Phone Number": "\(parentInfo2.parentPhoneNumber)"]
        let student :Dictionary <String,String> = ["Student Name": "\(studentInfo2.name)", "Student Grade": "\(studentInfo2.grade)", "Student ID": "\(studentInfo2.ID)"]
        print(parent)
        print(student)
        print(teacherInfo)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}