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

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // TableView
    @IBOutlet weak var tableView: UITableView!
    let nib = UINib(nibName: "TableViewCellCalculationAmount", bundle: nil)
    // Realmのインスタンス
    let realm = try! Realm()
    // ActivityAmountのコレクション
    var activityAmounts = try! Realm().objects(ActivityAmount.self).sorted(byKeyPath: "date", ascending: false).sorted(byKeyPath: "date", ascending: false)
    let formatter = DateFormatter()
    // TableView表示用データ
    var sectionArray:[String] = []
    var sectioDataArray:[[ActivityAmount]] = [[]]
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    
    /* 初期表示部・BackgroundTask部
     *
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // テーブルセルのタップを無効にする
        //ableView.allowsSelection = false
        tableView.register(nib,forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        formatter.dateFormat = "yyyyMMddhhmmss"
        generateSectionQue()
        // Do any additional setup after loading the view.
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            do{
                try AVAudioSession.sharedInstance().setActive(true)
                Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(recordAmount), userInfo: nil, repeats: true)
            }
        }catch{
            print("Error !")
        }
    }
    // 活動量を蓄積(今回は起動後の時間で代用します。)
    func recordAmount(timer: Timer) {
        self.timer_sec += 1.0
        
        let activityAmouint = ActivityAmount()
        if activityAmounts.count != 0{
            activityAmouint.id = activityAmounts.max(ofProperty: "id")! + 1
        }
        // 保存
        try! realm.write {
            formatter.dateFormat = "yyyyMMddhhmmss"
            activityAmouint.date = formatter.string(from: Date())
            activityAmouint.activityAmount = Double(timer_sec)
            realm.add(activityAmouint)
        }
        tableView.reloadData()
    }
    
    /* 再表示部
     *
     *
     */
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Delegate : TableView
     *
     *
    */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    // number of section in TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    // number of section row in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectioDataArray[section].count
    }
    // cell Data of TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! TableViewCellCalculationAmount
        let activityAmount = self.activityAmounts[indexPath.row]
        cell.setData("\(activityAmount.date)", "\(activityAmount.activityAmount)")
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Auto Layoutを使ってセルの高さを動的に変更する
        return UITableViewAutomaticDimension
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Generate TableView Section Array
    func generateSectionQue(){
        for date in self.activityAmounts{
            let activityAmount = date
            if let year = Int(date.date.substring(to: date.date.index(date.date.startIndex, offsetBy:4))){
                if let date = Int(date.date.substring(with: date.date.index(date.date.startIndex,offsetBy: 4)..<date.date.index(date.date.endIndex,offsetBy:-8))){
                    if let index = sectionArray.index(of: "\(year)月\(date)月"){
                        sectioDataArray[index].append(activityAmount)
                    }else{
                        let newAmountData = [activityAmount]
                        self.sectioDataArray.append(newAmountData)
                        self.sectionArray.append("\(year)月\(date)月")
                    }
                }
            }
        }
    }
}
