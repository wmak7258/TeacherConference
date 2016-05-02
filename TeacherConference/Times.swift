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
    init(Time t: String, Taken a: Bool){
        time = t
        taken = a
    }
    init(){
        time = ""
        taken = false
    }
}