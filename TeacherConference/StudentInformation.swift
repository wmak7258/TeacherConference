import UIKit

class StudentInformation: UIViewController {
    var studentName: String
    var level: String
    var studentID: String

    init(StudentName n:String, Level l:String, StudentID i:String)
    {
        studentName = n
        level = l
        studentID = i
    }
    
    init()
    {
        studentName = ""
        level = ""
        studentID = ""
    }

}
