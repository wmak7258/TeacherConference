//
//  StudentInfo.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation

class Student{
    var firstName: String
    var lastName: String
    var grade: Int
    var ID: Int
    var password: String
    var email: String
    
    init(Grade g:Int, ID i:Int, First f: String, Last l: String, Password p: String, Email e: String){
        firstName = f
        lastName = l
        grade = g
        ID = i
        password = p
        email = e
    }
    
    init(){
        firstName = ""
        lastName = ""
        grade = 0
        ID = 0
        password = ""
        email = ""
    }
}