//
//  SettingAccountViewController.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/08/06.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit
import Firebase

class SettingAccountViewController: UIViewController {
    @IBOutlet weak var displayName: UITextField!
    
    // ボタン：表示名を変更
    @IBAction func onClickChange(_ sender: Any) {
    }
    // ボタン：ログアウト
    @IBAction func onClickLogout(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        
        let loginController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginController!,animated: true, completion: nil)
        
        // let tabBarController = parent as! UITabBarController
        // tabBarController.selectedIndex = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
