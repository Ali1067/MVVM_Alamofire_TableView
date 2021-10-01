//
//  ApiManager.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import Foundation
import SwiftyJSON
import Alamofire

class ApiManager: NSObject {
    
    
    class func URlEncodeRequest(_ url: String,
                                method: HTTPMethod,
                                accessToken: String?,

                                success:@escaping (JSON?) -> Void,
                                fail:@escaping (_ status: Int, _ message: String) -> Void) {


        //        var headers = ["Content-Type": "application/x-www-form-urlencoded"]

        var headers : HTTPHeaders =  ["Content-Type": "application/x-www-form-urlencoded"]

        if accessToken != nil {
            headers  = ["Content-Type": "application/json","Authorization": accessToken!]

        }
        self.loggs("URL:\(url)nHeader:\(headers)")

        if self.checkInternetAvailable() {

            let Alamofire = Session.default
            Alamofire.session.configuration.timeoutIntervalForRequest = 180
            Alamofire.request(url, method: method, parameters: nil, encoding: URLEncoding.httpBody, headers: headers)
                .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    ////self.loggs("Progress: \(progress.fractionCompleted)")
                }
                .responseJSON { (response) in
                    print(response.result)
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        self.loggs("JSON : \(json)")
                        if json["code"] == 401 || json["code"] == "401" {
                            //                            self.isNotValidAuth(message: json["message"].stringValue)
                            fail(401, json["message"].stringValue)
                            return
                        }
                        success(json)
                    case .failure(_):
                        print("Alamofire Error Failure Case - ")
                    }
                }
        } else {
            fail(400, "Internet not available")
        }
    }
    
    
    private class func checkInternetAvailable () -> Bool {
        if !(NetworkReachabilityManager()?.isReachable)! {
            self.loggs(":: Internet not available :: ")
            return false
        }
        return true
    }
    
    private class func loggs(_ string: String) {
        print(string)
    }
    
    

    
    
   
    
}
