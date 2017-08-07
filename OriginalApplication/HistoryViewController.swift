//
//  HistoryViewController.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/07/31.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift

class HistoryViewController: UIViewController {
    // TableView
    @IBOutlet weak var tableView: UITableView!
//    let nib = UINib(nibName: "TableViewCellCalculationAmount", bundle: nil)
    // Realmのインスタンス
    let realm = try! Realm()
    // ActivityAmountのコレクション
//    var activityAmounts = try! Realm().objects(ActivityAmount.self).sorted(byKeyPath: "date", ascending: false)
//    let formatter = DateFormatter()
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    
    /* 初期表示部・BackgroundTask部
     *
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.register(nib,forCellReuseIdentifier: "Cell")
//        tableView.rowHeight = UITableViewAutomaticDimension
//        formatter.dateFormat = "yyyy/MM/dd"
        
//        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(recordAmount), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
/*
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            print("category play")
            do{
                try AVAudioSession.sharedInstance().setActive(true)
                print("I'm alive ...?")
            }
        }catch{
            print("Error !")
        }
    }
    // 活動量を蓄積
    func recordAmount(timer: Timer) {
        self.timer_sec += 0.1
        print("只今：\(timer_sec)")
        
        let activityAmouint = ActivityAmount()
        activityAmouint.activityAmount = Double(timer_sec)
        realm.add(activityAmouint,update: true)
*/
 }

    
    /* 再表示部
     *
     *
     */
    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Delegate : TableView
     *
     *
 
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activityAmounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! TableViewCellCalculationAmount
        let activityAmount = self.activityAmounts[indexPath.row]
        cell.setData("\(activityAmount.date)", "\(activityAmount.activityAmount)")
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeight__forRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
     
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
