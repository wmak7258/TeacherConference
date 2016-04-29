//
//  ParentInformation.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation

class Parent {
    var parentName: String
    var parentEmail: String
    var parentPhoneNumber: Int
    
    init(Name n:String, Email e:String, PhoneNumber p: Int){
        parentName = n
        parentEmail = e
        parentPhoneNumber = p
    }
    
    init(){
        parentName = ""
        parentEmail = ""
        parentPhoneNumber = 0
    }

}