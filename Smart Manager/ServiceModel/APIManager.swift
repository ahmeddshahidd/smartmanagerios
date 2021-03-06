
import UIKit

typealias DefaultAPIFailureClosure = (NSError) -> Void
typealias DefaultAPISuccessClosure = (Dictionary<String,AnyObject>) -> Void
typealias DefaultBoolResultAPISuccesClosure = (Bool) -> Void
typealias DefaultDictionaryResultAPISuccesClosure = (Dictionary<String,Any>) -> Void
typealias DefaultArrayResultAPISuccessClosure = (NSArray) -> Void


protocol APIErrorHandler {
    func handleErrorFromResponse(response: Dictionary<String,AnyObject>)
    func handleErrorFromERror(error:NSError)
}


class APIManager: NSObject {
    

    static let sharedInstance = APIManager()
    
    
    var serverToken: String? {
        get{
            
           return ""//AppStateManager.sharedInstance.loggedInUser._token
        }
        
    }
    
    
    let authenticationManagerAPI = AuthenticationAPIManager()
    
}
