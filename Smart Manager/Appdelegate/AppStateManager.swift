
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
    
    func createUser(with userModel: [String:Any], user_id: String)
    {
        var loginUserModel: [String : Any] = userModel
        
        loginUserModel["user_id"] = user_id
        
        let user = User(value: loginUserModel)
        
        self.loggedInUser = user
        
        try! Global.APP_REALM?.write(){
            Global.APP_REALM?.add(self.loggedInUser, update: true)
        }
        print(AppStateManager.sharedInstance.loggedInUser)
        
        if !self.loggedInUser.user_id.isEmpty {
            Constants.APP_DELEGATE.changeRootViewController()
        }

    }
    
    
  
}
