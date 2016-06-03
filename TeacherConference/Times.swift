//
//  Times.swift
//  TeacherConference
//
//  Created by student1 on 4/29/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import Foundation

class Time{
    var time: String
    var taken: Bool
    var id: String
    init(Time t: String, Taken a: Bool, ID i: String){
        time = t
        taken = a
        id = i
    }
    init(){
        time = " "
        taken = false
        id = " "
    }
}