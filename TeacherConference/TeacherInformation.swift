import UIKit

class teacherInformation {
    var teacherName: String
    var classes: String
    var roomNumber: String
    var time: String
    var teacherEmail: String
    
    init(TeacherName n:String,Classes c:String, RoomNumber rn:String, Time t:String, TeacherEmail e:String)
    {
        teacherName = n
        classes = c
        roomNumber = rn
        time = t
        teacherEmail = e
    }
    
    init()
    {
        teacherName = ""
        classes = ""
        roomNumber = ""
        time = ""
        teacherEmail = ""
    }
}
