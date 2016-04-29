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
    
    var classArray: [Classes] = [Classes]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let teacherInfo :Dictionary <String,String> = ["Teacher Name": "\(teacherInfo2).teacherName)", "Class": "\(teacherInfo2.classes)", "Room Number": "\(teacherInfo2.roomNumber)", "Time": "\(teacherInfo2.time)", "Teacher E-Mail": "\(teacherInfo2.teacherEmail)", "TeacherID": "\(teacherInfo2.teacherID)", "Teacher School": "\(teacherInfo2.teacherSchool)"]
        let parent :Dictionary <String,String> = ["Parent Name": "\(parentInfo2.parentName)", "Parent E-Mail": "\(parentInfo2.parentEmail)", "Parent Phone Number": "\(parentInfo2.parentPhoneNumber)"]
        let student :Dictionary <String,String> = ["Student Name": "\(studentInfo2.name)", "Student Grade": "\(studentInfo2.grade)", "Student ID": "\(studentInfo2.ID)"]
        print(parent)
        print(student)
        print(teacherInfo)
        
        let class1 = Classes(class1: "FGHJ", teacher: "RTYHGFYU")
        classArray.append(class1)
        let class2 = Classes(class1: "KJHYUHG", teacher: "JHGHBVG")
        classArray.append(class2)
        let class3 = Classes(class1: "sdfg", teacher: "sdfghj")
        classArray.append(class3)
        let class4 = Classes(class1: "wefb", teacher: "qwe")
        classArray.append(class4)
        let class5 = Classes(class1: "iuhvc", teacher: "zxcv")
        classArray.append(class5)
        let class6 = Classes(class1: "sdr", teacher: "asdf")
        classArray.append(class6)
        let class7 = Classes(class1: "by", teacher: "ljh")
        classArray.append(class7)
        let class8 = Classes(class1: "qwsxcf", teacher: "ujm")
        classArray.append(class8)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentClass = classArray[indexPath.row]
        currentCell.textLabel!.text = currentClass.class1
        currentCell.detailTextLabel?.text = currentClass.teacher
        return currentCell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ClassInfoViewController
        NVC.studentInfo3 = studentInfo2
        NVC.parentInfo3 = parentInfo2
        NVC.teacherInfo3 = teacherInfo2
    }
    
    
}