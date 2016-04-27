//
//  TimesViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/22/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class TimesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
  

}
