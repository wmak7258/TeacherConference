// Wayne Mak
//  ViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var information = studentInformation()
    override func viewDidLoad() {
        super.viewDidLoad()
        var studentInfo :Dictionary <String,String> = ["name": "\(information.name)", "email": "\(information.email)", "ID": "\(information.ID)", "phoneNumber": "\(information.phone)", "school": "\(information.school)"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}