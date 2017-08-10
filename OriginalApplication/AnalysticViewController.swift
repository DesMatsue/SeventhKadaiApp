//
//  AnalysticViewController.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/07/31.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class AnalysticViewController: UIViewController {
    // @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var lineChartView: LineChartView!
    
    var activityAmounts = try! Realm().objects(ActivityAmount.self).sorted(byKeyPath: "date", ascending: false).sorted(byKeyPath: "date", ascending: false)
    let userDefaults = UserDefaults.standard
    // var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure lineChart
        lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lineChartView.xAxis.labelRotationAngle = CGFloat(-30)
        
        /*
        months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        let unitsSold = [50.3, 68.3, 113.3, 115.7, 160.8, 214.0, 220.4, 132.1, 176.2, 120.9, 71.3, 48.0]
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = true
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChartView.xAxis.labelRotationAngle = CGFloat(-30)
        barChartView.chartDescription?.text = ""
        */
        setChart()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setChart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //func setChart(dataPoints: [String], values: [Double]) {
    func setChart() {
        /*
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "起動時間")
        // colorCode from UserDefault
        if let storedData = userDefaults.object(forKey: "data") as? Data{
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? UserSettings{
                if let color = unarchivedData.color{
                    chartDataSet.colors = [color]
                }else{
                    chartDataSet.colors = [UserSettings().color!]
                }
            }else{
                chartDataSet.colors = [UserSettings().color!]
            }
        }else{
            chartDataSet.colors = [UserSettings().color!]
        }
        
        barChartView.data = chartData  
        */
        
        // Values for Y and X Axis
        var dataEntries: [ChartDataEntry] = []
        var xAxisLabels: [String] = []
        
        // Generate Values
        for i in 0..<activityAmounts.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: activityAmounts[i].activityAmount)
            dataEntries.append(dataEntry)
            
            let date = activityAmounts[i].date
            let timeLabel = date.substring(from: date.index(date.endIndex, offsetBy: -6))
            let hour = timeLabel.substring(with: timeLabel.index(timeLabel.startIndex,offsetBy: 0)..<timeLabel.index(timeLabel.endIndex, offsetBy: -4))
            let min = timeLabel.substring(with: timeLabel.index(timeLabel.startIndex,offsetBy: 2)..<timeLabel.index(timeLabel.endIndex, offsetBy: -2))
            let sec = timeLabel.substring(with: timeLabel.index(timeLabel.startIndex,offsetBy: 4)..<timeLabel.index(timeLabel.endIndex, offsetBy: 0))
            xAxisLabels.append("\(hour):\(min):\(sec)")
        }

        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Accumuration")
        lineChartDataSet.circleRadius = 0
        lineChartDataSet.lineWidth = CGFloat(13)
        lineChartDataSet.drawValuesEnabled = false
        
        // colorCode from UserDefault
        if let storedData = userDefaults.object(forKey: "data") as? Data{
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? UserSettings{
                if let color = unarchivedData.color{
                    lineChartDataSet.colors = [color]
                }else{
                    lineChartDataSet.colors = [UserSettings().color!]
                }
            }else{
                lineChartDataSet.colors = [UserSettings().color!]
            }
        }else{
            lineChartDataSet.colors = [UserSettings().color!]
        }
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xAxisLabels)
        lineChartView.data = lineChartData
        
        lineChartView.data?.notifyDataChanged()
        lineChartView.notifyDataSetChanged()
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
