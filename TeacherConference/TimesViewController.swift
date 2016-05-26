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
    var id = ""
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var timesArray: [Time] = [Time]()
    
    var hourArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
            if connect {
                self.client.execute("select * from conference_schedule where teacher_id = 90572499", completion: { (results) in
                    for table in results{
                        for row in table as! NSArray
                        {
                            self.timeInformation.time = row.objectForKey("time_complete") as! String
                            print(self.timeInformation.time)
                            self.insertTime()
                            self.id = row.objectForKey("id") as! String
                            print(self.id)
                            
                        }
                    }
                    
                    self.myTableView.reloadData()
                })
            }
        }
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
    func insertTime(){
        let time2 = Time(Time: self.timeInformation.time, Taken: true, Hour: 0)
        self.timesArray.append(time2)
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "toDone"{
                let NVC = segue.destinationViewController as! EndViewController
                let currentRow = myTableView.indexPathForSelectedRow?.row
                if timeInformation.taken == true{
                    let alert = UIAlertController(title: "Are you done?", message: "Are you sure that all this information is correct?", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: {
                        action in
                    })
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                NVC.studentInfo5 = studentInfo4
                NVC.parentInfo5 = parentInfo4
                NVC.teacherInfo5 = teacherInfo4
                NVC.timeInfo = timesArray[currentRow!]
                NVC.classInfo = classInfo
                print(studentInfo4.ID)
                client.connect("mobileappdev.d214.org", username: "MobileAppStu", password: "M0b1l3@pp", database: "HS214PTConference") { (connect) in
                    if connect {
                        self.client.execute("update conference_schedule set studentPK = \(self.studentInfo4.ID) where id = \(self.id)", completion: { (results) in
                            for table in results{
                                for row in table as! NSArray
                                {
                                    self.timeInformation.time = row.objectForKey("time_complete") as! String
                                    print(self.timeInformation.time)
                                    self.insertTime()
                                }
                            }
                            
                            
                        })
                    }
                }
            }
        }
    }

