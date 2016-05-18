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
                            self.teacherInfo3.classes = row.objectForKey("teacher") as! String
                            self.teacherInfo3.teacherSchool = row.objectForKey("schoolPK") as! String
                            
                            self.teacherNameLabel.text = "Teacher's name: \(self.teacherInfo3.teacherName)"
                            self.courseNameLabel.text = "Course: \(self.classInfo.class1)"
                            self.schoolLabel.text = "School: \(self.teacherInfo3.teacherSchool)"
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! TimesViewController
        NVC.studentInfo4 = self.studentInfo3
        NVC.parentInfo4 = self.parentInfo3
        NVC.teacherInfo4 = self.teacherInfo3
        NVC.classInfo = self.classInfo
    }

}
