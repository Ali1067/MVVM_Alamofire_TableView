//
//  ViewModel.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import Foundation
import SwiftyJSON
import Alamofire

class ViewModel {

//
    class func getFollowlist(username: String, follow: String,  success:@escaping (_ offersList: [UserModel]) -> Void, failure:@escaping (_ message: String) -> Void) {
//        https://api.github.com/users/follower/Ali
        
        let finalUrl = Constants.kGetUser + username + "/" +  follow
        ApiManager.URlEncodeRequest(finalUrl  , method: .get, accessToken: nil, success: { (jsonResponse) in

            if let value = jsonResponse?["message"].string{
                failure(value)
            } else if jsonResponse != nil {
                success(UserModel.ConverDic(datalist: jsonResponse!))
                
            }
        })
        { (status, message) in
            failure(message)
        }
    }
    
    
    
    class func getOffers(username: String, success:@escaping (_ offersList: UserModel) -> Void, failure:@escaping (_ status: Int, _ message: String) -> Void) {
        
        let finalUrl = Constants.kGetUser + username
        
//        ApiManager.URlEncodeRequest("\(Constants.kGetUser + "Ali1067")", method: .get, accessToken: nil, success: { (jsonResponse) in
//
        ApiManager.URlEncodeRequest(finalUrl, method: .get, accessToken: nil, success: { (jsonResponse) in
            
            if let value = jsonResponse?["message"].string {
                failure(400, value)
            } else if let value = jsonResponse {
                success(UserModel(data: value))
            }
        }) { (status, message) in
            failure(status, message)
        }
    }

 
    
}


/*
 This is our Service class (View Model)
 */
