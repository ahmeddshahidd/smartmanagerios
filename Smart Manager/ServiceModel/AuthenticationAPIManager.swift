

import UIKit
import Alamofire
import SwiftyJSON
class AuthenticationAPIManager: APIManagerBase {


    func authenticateUserWith(email: String,password: String,
                          success:@escaping DefaultArrayResultAPISuccessClosure,
                          failure:@escaping DefaultAPIFailureClosure){
    
       
        let route: URL = POSTURLforRoute(route: Route.Login.rawValue)!
        
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        
        
      self.postRequestWith(route: route, parameters: parameters, success: success, failure: failure)
        
    }
}
