//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var information = teacherInformation()

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var teacherInfo :Dictionary <String,String> = ["Teacher Name": "\(information.teacherName)", "Class": "\(information.classes)", "Room Number": "\(information.roomNumber)", "Time": "\(information.time)", "Teacher E-Mail": "\(information.teacherEmail)"]

    }
    
    @IBAction func goToNextViewController(sender: UIButton) {
    }

    


}