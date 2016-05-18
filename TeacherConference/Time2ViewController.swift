//
//  Time2ViewController.swift
//  TeacherConference
//
//  Created by student1 on 5/17/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class Time2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var studentInfo5 = Student()
    var parentInfo5 = Parent()
    var teacherInfo5 = Teacher()
    var timeInfo = Time()
    var classInfo = Classes()
    var hourArray: [Time] = [Time]()
    var client = SQLClient()
    
    
    override func viewWillAppear(animated: Bool) {
        self.client.execute("SELECT * FROM conference_schedule Where conferencePK = '\(timeInfo.time)' ") {
            results in
            for table in results {
                for row in table as! NSArray{
                    print(row)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("time2")!
        let currentTime = hourArray[indexPath.row]
        currentCell.textLabel!.text = currentTime.hour.description
        return currentCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourArray.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! EndViewController
        NVC.studentInfo6 = studentInfo5
        NVC.parentInfo6 = parentInfo5
        NVC.teacherInfo6 = teacherInfo5
        NVC.timeInfo = timeInfo
        NVC.classInfo = classInfo
    }
}
