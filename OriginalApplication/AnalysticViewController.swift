//
//  AnalysticViewController.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/07/31.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit
import Charts

class AnalysticViewController: UIViewController {
    @IBOutlet weak var barChartView: BarChartView!

    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        let unitsSold = [50.3, 68.3, 113.3, 115.7, 160.8, 214.0, 220.4, 132.1, 176.2, 120.9, 71.3, 48.0]
        
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = true
        barChartView.chartDescription?.text = "京都府の月毎の降水量グラフ"
        barChartView.tintColor = UIColor.init(colorLiteralRed: 140, green: 0, blue: 204, alpha: 0)
        barChartView.backgroundColor = UIColor.init(colorLiteralRed: 140, green: 0, blue: 204, alpha: 0)
        setChart(dataPoints: months, values: unitsSold)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "降水量")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData  
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
