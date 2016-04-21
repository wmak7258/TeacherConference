//
//  StudentInfo.swift
//  TeacherConference
//
//  Created by student1 on 4/21/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation

class Student{
    let name: String
    let grade: Int
    let ID: Int
    
    init(Name n:String, Grade g:Int, ID i:Int){
        name = n
        grade = g
        ID = i
    }
    
    init(){
        name = ""
        grade = 0
        ID = 0
    }
}