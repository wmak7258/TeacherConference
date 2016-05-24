import UIKit

class Teacher {
    var teacherName: String
    var classes: String
    var roomNumber: String
    var time: String
    var teacherEmail: String
    var teacherID: String
    var teacherSchool: String
    
    init(TeacherName n:String,Classes c:String, RoomNumber rn:String, time t:String, TeacherEmail e:String, TeacherID id:String, TeacherSchool ts:String)
    {
        teacherName = n
        classes = c
        roomNumber = rn
        time = t
        teacherEmail = e
        teacherID = id
        teacherSchool = ts
    }
    
    init()
    {
        teacherName = ""
        classes = ""
        roomNumber = ""
        time = ""
        teacherEmail = ""
        teacherID = "90002999"
        teacherSchool = ""
    }
}