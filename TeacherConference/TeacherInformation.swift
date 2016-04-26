import UIKit

class Teacher {
    var teacherName: String
    var classes: String
    var password: String
    var school: String
    var teacherID: String
    var roomNumber: String
    var time: String
    var teacherEmail: String
    
    init(TeacherName n:String,Classes c:String,Password p:String,School s:String,TeacherID i:String, RoomNumber rn:String, Time t:String, TeacherEmail e:String)
    {
        teacherName = n
        classes = c
        password = p
        school = s
        teacherID = i
        roomNumber = rn
        time = t
        teacherEmail = e
    }
    
    init()
    {
        teacherName = ""
        classes = ""
        password = ""
        school = ""
        teacherID = ""
        roomNumber = ""
        time = ""
        teacherEmail = ""
    }
}