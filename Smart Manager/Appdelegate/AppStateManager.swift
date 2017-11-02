
import UIKit
import RealmSwift
class AppStateManager: NSObject {

    
    static let sharedInstance = AppStateManager()
    var loggedInUser: User!
    var realm: Realm!
   

    override init() {
       
        super.init()
        
        if(!(realm != nil)){
            realm = try! Realm()
        }
        
        loggedInUser = realm.objects(User.self).first
    }
    
    func isUserLoggedIn() -> Bool{
        
        if (self.loggedInUser) != nil {
            if self.loggedInUser.isInvalidated {
                return false
            }
            return true
        }
        return false
    }
    
    
  
}
