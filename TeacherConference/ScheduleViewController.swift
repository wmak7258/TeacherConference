//
//  ScheduleViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var information = teacherInformation()
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let teacherInfo :Dictionary <String,String> = ["Teacher Name": "\(information.teacherName)", "Class": "\(information.classes)", "Room Number": "\(information.roomNumber)", "Time": "\(information.time)", "Teacher E-Mail": "\(information.teacherEmail)"]
        print(teacherInfo)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }

}
