import UIKit

class studentInformation {
    var name: String
    var email: String
    var ID: String
    var phone: String
    var school: String
    
    init(Name n:String,Email e:String, ID id:String, Phone p:String, School s:String)
    {
        name = n
        email = e
        ID = id
        phone = p
        school = s
    }
    
    init()
    {
        name = ""
        email = ""
        ID = ""
        phone = ""
        school = ""
    }

    
}