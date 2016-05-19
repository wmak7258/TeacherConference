//
//  ClassInfoViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/22/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class ClassInfoViewController: UIViewController {
    var client = SQLClient()
    var studentInfo3 = Student()
    var parentInfo3 = Parent()
    var teacherInfo3 = Teacher()
    var classInfo = Classes()
    
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM Teacher ") {
                    results in
                    print(results)
                    for table in results as NSArray {
                        for row in table as! NSArray {
                            self.teacherInfo3.teacherName = row.objectForKey("teacher_name") as! String
                            self.teacherInfo3.teacherSchool = row.objectForKey("schoolPK") as! String
                            
                            self.teacherNameLabel.text = "Teacher's name: \(self.teacherInfo3.teacherName)"
                            self.courseNameLabel.text = "Course: \(self.classInfo.class1)"

                            if self.teacherInfo3.teacherSchool == "008" {
                                self.schoolLabel.text = "School: Buffalo Grove High School"
                            } else if self.teacherInfo3.teacherSchool == "002" {
                                self.schoolLabel.text = "School: Prospect High School"
                            } else if self.teacherInfo3.teacherSchool == "004" {
                                self.schoolLabel.text = "School: Wheeling High School"
                            } else if self.teacherInfo3.teacherSchool == "005" {
                                self.schoolLabel.text = "School: Elk Grove High School"
                            } else if self.teacherInfo3.teacherSchool == "006" {
                                self.schoolLabel.text = "School: John Hersey High School"
                            } else if self.teacherInfo3.teacherSchool == "007" {
                                self.schoolLabel.text = "School: Rolling Meadows High School"
                            }
                                
                            }
                            }
                        }
                    }
        
        
                    
                }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! TimesViewController
        NVC.studentInfo4 = studentInfo3
        NVC.parentInfo4 = parentInfo3
        NVC.teacherInfo4 = teacherInfo3
        NVC.classInfo = classInfo
    }
}
