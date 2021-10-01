//
//  FetchedUser.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import UIKit

class FetchedUser: BaseVCViewController {

    @IBOutlet weak var fetchedTv: UITableView!
    
    var fetchUserDic = [UserModel]()
    var UserName: String = ""
    let cellid = "XibTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchedTv.register(UINib(nibName: cellid, bundle: nil), forCellReuseIdentifier: cellid)

        self.fetchedTv.delegate = self
        self.fetchedTv.dataSource = self

        // Do any additional setup after loading the view.
        if Constants.kWhich == Constants.kFollowers {
         
            getList(which: Constants.kFollowers)
        }else {
            // we can use else-if too, can be discuss in interview

            getList(which: Constants.kFollowing)
        }
        
       

    }

    /*
  //   MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */
    
    
    func getList(which: String) {
        
        ViewModel.getFollowlist(username: UserName, follow: which) { list in
            
            self.fetchUserDic = list
            self.fetchedTv.reloadData()
        } failure: { msg in
            
        }


    }

}

extension FetchedUser: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchUserDic.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as? XibTableViewCell {
            let user = fetchUserDic[indexPath.row]
            cell.lblUserName.text = user.getLogin()
            cell.lblName.text = user.getid()
            
            RoundImageView(image: cell.ivProfile)
            if let imageUrl = URL(string: user.getAvatarUrl().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
                cell.ivProfile.sd_setImage(with: imageUrl, completed: .none)
            }
            return cell
        }
        
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        openUrl(url: fetchUserDic[indexPath.row].getHtmlUrl())
        
      
        
    }
    
 
    
 
}
