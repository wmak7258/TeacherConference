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
    @IBOutlet weak var schoolView: UIImageView!
    @IBOutlet weak var schoolView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM teacher_course Where teacher_id = \(self.classInfo.teacherID)") {
                    results in
                    print(self.classInfo.teacherID)
                    for table in results as NSArray {
                        for row in table as! NSArray {
                            self.teacherInfo3.teacherSchool = row.objectForKey("school_id") as! String
                            self.classInfo.teacherID = row.objectForKey("teacher_id") as! String
                            self.teacherNameLabel.text = "Teacher's name: \(self.classInfo.teacher)"
                            self.courseNameLabel.text = "Course: \(self.classInfo.class1)"
                            
                            if self.teacherInfo3.teacherSchool == "008" {
                                self.schoolLabel.text = "School: Buffalo Grove High School"
                                let myImage = UIImage(named: "buffalogrove")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "buffalogrove")
                                self.schoolView2.image = myImage2
                            } else if self.teacherInfo3.teacherSchool == "002" {
                                self.schoolLabel.text = "School: Prospect High School"
                                let myImage = UIImage(named: "Prospect")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "Prospect")
                                self.schoolView2.image = myImage2
                            } else if self.teacherInfo3.teacherSchool == "004" {
                                self.schoolLabel.text = "School: Wheeling High School"
                                let myImage = UIImage(named: "wheeling")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "wheeling")
                                self.schoolView2.image = myImage2
                            } else if self.teacherInfo3.teacherSchool == "005" {
                                self.schoolLabel.text = "School: Elk Grove High School"
                                let myImage = UIImage(named: "Elk Grove")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "Elk Grove")
                                self.schoolView2.image = myImage2
                            } else if self.teacherInfo3.teacherSchool == "006" {
                                self.schoolLabel.text = "School: John Hersey High School"
                                let myImage = UIImage(named: "nanook")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "nanook")
                                self.schoolView2.image = myImage2
                            } else if self.teacherInfo3.teacherSchool == "007" {
                                self.schoolLabel.text = "School: Rolling Meadows High School"
                                let myImage = UIImage(named: "rollingmeadows")
                                self.schoolView.image = myImage
                                let myImage2 = UIImage(named: "rollingmeadows")
                                self.schoolView2.image = myImage2
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