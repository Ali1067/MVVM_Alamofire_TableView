//
//  UserMode.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import Foundation
import SwiftyJSON
import Alamofire
class UserModel {
    private var login: String = ""
    private var id: String = ""
    private var url: String = ""
    private var followers_url: String = ""
    private var following_url: String = ""

    
    
    
    private var location: String = ""
    private var bio: String = ""
    private var name: String = ""
    private var followers: Int = 0
    private var following: Int = 0
    private var avatar_url: String = ""
    private var html_url: String = ""
    
    init() {
//        self.name =
//        self.followers = data["followers"].intValue
//        self.following = data["following"].intValue
//        self.avatar_url = data["avatar_url"].stringValue
//        self.html_url = data["html_url"].stringValue
        
        
    }
    init(data: JSON) {
        
        self.id = data["id"].stringValue
        self.bio = data["bio"].stringValue
        self.location = data["location"].stringValue
        self.login = data["login"].stringValue
        self.name = data["name"].stringValue
        self.followers = data["followers"].intValue
        self.following = data["following"].intValue
        self.avatar_url = data["avatar_url"].stringValue
        self.html_url = data["html_url"].stringValue
        
        
    }
    
 
    func getid() -> String {
        return self.id
    }
    func getBio() -> String {
        return self.bio
    }
    func getLocation() -> String {
        return self.location
    }
    func getLogin() -> String {
        return self.login
    }
    func getName() -> String {
        return self.name
    }
 
    func getFollowers() -> Int {
        return self.followers
    }
    func getFollowings() -> Int {
        return self.following
    }
    func getAvatarUrl() -> String {
        return self.avatar_url
    }
    
    func getHtmlUrl() -> String {
        return self.html_url
    }
    

    
    class func ConverDic(datalist : JSON) -> [UserModel] {
          var list = [UserModel]()
          for i in 0..<datalist.count {
              list.append(UserModel(data: datalist[i]))
          }
          return list
      }
    
    class func convertToOrderModelList(datalist : JSON) -> [UserModel] {
          var list = [UserModel]()
          for i in 0..<datalist.count {
              list.append(UserModel(data: datalist[i]))
          }
          return list
      }
    
}






//{
//    "login": "Ali1067",
//    "id": 25032829,
//    "node_id": "MDQ6VXNlcjI1MDMyODI5",
//    "avatar_url": "https://avatars.githubusercontent.com/u/25032829?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/Ali1067",
//    "html_url": "https://github.com/Ali1067",
//    "followers_url": "https://api.github.com/users/Ali1067/followers",
//    "following_url": "https://api.github.com/users/Ali1067/following{/other_user}",
//    "gists_url": "https://api.github.com/users/Ali1067/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/Ali1067/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/Ali1067/subscriptions",
//    "organizations_url": "https://api.github.com/users/Ali1067/orgs",
//    "repos_url": "https://api.github.com/users/Ali1067/repos",
//    "events_url": "https://api.github.com/users/Ali1067/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/Ali1067/received_events",
//    "type": "User",
//    "site_admin": false,
//    "name": "Ali1067",
//    "company": null,
//    "blog": "www.mohammadali.pk",
//    "location": "Lahore, Pakistan",
//    "email": null,
//    "hireable": true,
//    "bio": null,
//    "twitter_username": "alienz143",
//    "public_repos": 10,
//    "public_gists": 0,
//    "followers": 0,
//    "following": 0,
//    "created_at": "2017-01-10T13:11:34Z",
//    "updated_at": "2021-08-12T09:05:12Z"
//}
