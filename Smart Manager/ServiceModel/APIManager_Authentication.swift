
import UIKit

extension APIManager{
    
    func authenticateUserWith(email: String,password: String,
                          success:@escaping DefaultArrayResultAPISuccessClosure,
                          failure:@escaping DefaultAPIFailureClosure){
        
        authenticationManagerAPI.authenticateUserWith(email: email, password: password, success: success, failure: failure)
    }

    
   

    
    
}
