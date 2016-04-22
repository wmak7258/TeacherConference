//
//  ScheduleViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentInfo2 = Student()
    var parentInfo2 = Parent()
    var teacherInfo2 = Teacher()
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
