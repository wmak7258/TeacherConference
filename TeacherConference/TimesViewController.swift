//
//  TimesViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/22/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import SQLClient

class TimesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var studentInfo4 = Student()
    var parentInfo4 = Parent()
    var teacherInfo4 = Teacher()
    var timeInformation = Time()
    var classInfo = Classes()
    var client = SQLClient()
    var connects = true

    
    @IBOutlet weak var myTableView: UITableView!
    
    var timesArray: [Time] = [Time]()
    
    var hourArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let time1 = Time(Time: "5:00", Taken: false, Hour: 0)
        timesArray.append(time1)
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentCell = tableView.dequeueReusableCellWithIdentifier("timeCell")!
        let currentTime = timesArray[indexPath.row]
        currentCell.textLabel!.text = currentTime.time
        if currentTime.taken == false{
            currentCell.detailTextLabel?.text = "Open"
        }else{
            currentCell.detailTextLabel?.text = "Taken"
        }
        return currentCell
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return timesArray.count
        }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "toDone"{
                let NVC = segue.destinationViewController as! EndViewController
                let currentRow = myTableView.indexPathForSelectedRow?.row
                NVC.studentInfo5 = studentInfo4
                NVC.parentInfo5 = parentInfo4
                NVC.teacherInfo5 = teacherInfo4
                NVC.timeInfo = timesArray[currentRow!]
                NVC.classInfo = classInfo
                if timesArray[currentRow!].taken == true{
                    let alert = UIAlertController(title: "That time slot is filled", message: "You may not book that time", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: {
                        action in
                        print("Dismiss was pressed")
                    })
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }else if segue.identifier == "toDelete"{
                    let NVC = segue.destinationViewController as! DeleteViewController
                    let currentRow = myTableView.indexPathForSelectedRow?.row
                    NVC.studentInfo5 = studentInfo4
                    NVC.parentInfo5 = parentInfo4
                    NVC.teacherInfo5 = teacherInfo4
                    NVC.timeInfo = timesArray[currentRow!]
                    NVC.classInfo = classInfo
                }
            }
        }
    }
