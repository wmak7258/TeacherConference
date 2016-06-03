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
    var filled = false
    var studentPK = ""
    
    @IBOutlet weak var myTableView: UITableView!
    
    var timesArray: [Time] = [Time]()
    var hourArray: [String] = []
    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData()
    }
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
                            self.timeInformation.id = row.objectForKey("id") as! String
                            self.studentPK = row.objectForKey("studentPK") as! String
                            if self.studentPK != "0"{
                                self.filled = true
                            }else if self.studentPK == "0"{
                                self.filled = false
                            }
                            self.insertTime()
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentTime = timesArray[indexPath.row]
        if currentTime.taken == false {
        performSegueWithIdentifier("toDone", sender: nil)
        }else if currentTime.taken == true{
        let alert = UIAlertController(title: "This slot is already filled", message: "Please choose a new time", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
        }
    }
    
    func insertTime(){
        let time2 = Time(Time: self.timeInformation.time, Taken: filled, ID: timeInformation.id)
            self.timesArray.append(time2)
        }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
      func viewWillAppear2(animated: Bool) {
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "HerseyBackground")
        let imageView = UIImageView(image: backgroundImage)
        myTableView.backgroundView = imageView
        myTableView.tableFooterView = UIView(frame: CGRectZero)
        myTableView.reloadData()
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
            
            
        }
    }
    
}

