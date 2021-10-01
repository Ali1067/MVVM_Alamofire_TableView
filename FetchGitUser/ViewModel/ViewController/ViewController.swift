//
//  ViewController.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import UIKit
import SDWebImage

class ViewController: BaseVCViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dict : UserModel!
    var imageUrl: String = ""
    
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblNoUser: UILabel!
    @IBOutlet weak var viewData: UIView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var btnFollower: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    
    }

    func fetchUserApi(user: String)  {
        self.startAnimation()
        
        ViewModel.getOffers(username: user, success: { (data) in
            self.dict = data
            DispatchQueue.main.async {
                self.stopAnimation()
                
                if self.dict != nil {
                    self.viewData.isHidden = false
                    self.RoundImageView(image: self.ivProfile)
                    
                    if let imageUrl = URL(string: self.dict.getAvatarUrl().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
                        self.ivProfile.sd_setImage(with: imageUrl, completed: .none)
                    }
                    self.lblName.text! = self.dict.getLogin()
                    self.lblUserName.text! = self.dict.getBio()
                    self.location.text! = self.dict.getLocation()
                    self.btnFollower.setTitle("Followers: \(self.dict.getFollowers())", for: .normal)
                    self.btnFollowing.setTitle("Following: \(self.dict.getFollowings())", for: .normal)
                    
                    
                    
                    //                    ivProfile.setImageWithAnimation(url: data, placeholderImage: UIImage(named: ""))
                    
                    //                    if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "FetchedUser") as? FetchedUser {
                    //                        vc.fetchUserDic = self.dict
                    //                        self.navigationController?.pushViewController(vc, animated: true)
                    //                    }
                    
                    
                    
                    
                } else {
                    
                    self.viewData.isHidden = true
                    self.ShowAlert(title: "Oops", message: "No User Found", okText: "OK", CancelText: "Cancel") {
                    } CancelClouser: {
                        
                    }
                }
            }
        }) {(_, message) in
            self.stopAnimation()
            self.viewData.isHidden = true
            self.ShowAlert(title: self.searchBar.text!, message: message, okText: "OK", CancelText: "Cancel") {
            } CancelClouser: {
                
            }
        }
    }
    
    
    @IBAction func btnSearch(_ sender: Any) {
        if (searchBar.text?.isEmpty)! {
            ShowAlert(title: "Username missing", message: "Please Enter Username to search", okText: "OK", CancelText: "Cancel") {
            } CancelClouser: {}
        }else{
            fetchUserApi(user: self.searchBar.text ?? "")
        }
    }
    
    @IBAction func btnFollowers(_ sender: Any) {
        Constants.kWhich = Constants.kFollowers
        
        
        
        
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "FetchedUser") as? FetchedUser {
            
            vc.UserName = self.searchBar.text!

            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btnFollowing(_ sender: Any) {
        Constants.kWhich = Constants.kFollowing
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "FetchedUser") as? FetchedUser {
            vc.UserName = self.searchBar.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

