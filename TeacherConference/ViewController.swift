//  Brandon Perkins
//  ViewController.swift
//  TeacherConference
//
//  Created by student1 on 4/14/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var information = studentInformation()

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentIdentificationTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var studentInfo :Dictionary <String,String> = ["name": "\(information.name)", "email": "\(information.email)", "ID": "\(information.ID)", "phoneNumber": "\(information.phone)", "school": "\(information.school)"]

    }
    
    @IBAction func goToNextViewController(sender: UIButton) {
    }

    


}