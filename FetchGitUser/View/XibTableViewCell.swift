//
//  XibTableViewCell.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import UIKit

class XibTableViewCell: UITableViewCell {

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblName: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFollowers(_ sender: Any) {
        
    }
    
    @IBAction func btnFollowing(_ sender: Any) {
        
    }
}
