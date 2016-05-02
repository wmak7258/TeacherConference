//
//  TimesViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/22/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class TimesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var timeInformation = Time()
    
    @IBOutlet weak var myTableView: UITableView!
    
    var timesArray: [Time] = [Time]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let time1 = Time(Time: "5:00", Taken: true)
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
  

}
