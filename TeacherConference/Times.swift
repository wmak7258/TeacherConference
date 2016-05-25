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
    var hour: Int
    init(Time t: String, Taken a: Bool, Hour h: Int){
        time = t
        taken = a
        hour = h
    }
    init(){
        time = " "
        taken = false
        hour = 0
    }
}