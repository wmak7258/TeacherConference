//
//  ScheduleViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient


class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentInfo2 = Student()
    var parentInfo2 = Parent()
    var teacherInfo2 = Teacher()
    var client = SQLClient()
    var connects = false
    var studentPK: String!
    var classInfo = Classes()
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var classArray: [Classes] = [Classes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("SELECT * FROM students_courses where studentPK = \(self.studentPK)") {
                    results in
                    print(results)
                    for table in results as NSArray {
                        for row in table as! NSArray {
                            self.classInfo.class1 = row.objectForKey("course_title") as! String
                            self.classInfo.teacher = row.objectForKey("teacher_name") as! String
                            self.classInfo.teacherID = row.objectForKey("teacher_id") as! String
                            self.studentInfo2.ID = Int(self.studentPK)!
                            
                            self.insertClass()
                            
                        }
                    }
                    self.myTableView.reloadData()
                }
            }
        }
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
    
    func insertClass(){
        let class2 = Classes(class1: "\(classInfo.class1)", teacher: "\(classInfo.teacher)", teacherID: "\(classInfo.teacherID)")
        self.classArray.append(class2)
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }

    override func viewWillAppear(animated: Bool) {
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "HerseyBackground")
        let imageView = UIImageView(image: backgroundImage)
        myTableView.reloadData()
        myTableView.backgroundView = imageView
        myTableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! ClassInfoViewController
        let currentRow = myTableView.indexPathForSelectedRow?.row
        NVC.classInfo = classArray[currentRow!]
        NVC.studentInfo3 = studentInfo2
        NVC.parentInfo3 = parentInfo2
        NVC.teacherInfo3 = teacherInfo2
        
    }
    
    
}