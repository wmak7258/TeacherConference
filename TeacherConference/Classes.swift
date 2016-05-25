//
//  Classes.swift
//  TeacherConference
//
//  Created by student1 on 4/27/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation

class Classes {
    var class1: String
    var teacher: String
    var teacherID: String
   
    init(class1 c1: String, teacher t:String, teacherID tID: String) {
        class1 = c1
        teacher = t
        teacherID = tID
       
    }
    init() {
        class1 = " "
        teacher = " "
        teacherID = " "
    }
    
    
}
