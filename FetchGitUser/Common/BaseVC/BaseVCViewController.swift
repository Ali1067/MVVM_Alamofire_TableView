//
//  BaseVCViewController.swift
//  FetchGitUser
//
//  Created by Muhammad Ali on 29/09/2021.
//  Email:-  Ali1067@outlook.com
//  Call:- +92 331 2611993
//

import UIKit
import ProgressHUD

class BaseVCViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    func startAnimation()  {
        ProgressHUD.show()
    }
    
    func stopAnimation()  {
        ProgressHUD.dismiss()
    }
    
    
    func ShowAlert(title: String, message: String, okText: String, CancelText: String, OkClouser: @escaping () -> Void, CancelClouser: @escaping () -> Void){
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: okText, style: .default, handler: { (action: UIAlertAction!) in
            OkClouser()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: CancelText, style: .cancel, handler: { (action: UIAlertAction!) in
         CancelClouser()
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    func RoundImageView(image: UIImageView)  {
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
    
    
    func openUrl(url: String)  {
        if let url = URL(string: url) {
               if UIApplication.shared.canOpenURL(url) {
                   if #available(iOS 10.0, *) {
                       UIApplication.shared.open(url, options: [:], completionHandler: nil)
                   } else {
                       UIApplication.shared.openURL(url)
                   }
               }
           }
    }
}






