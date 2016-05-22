//
//  HallOfTimeViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 22/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit
import Charts

class HallOfTimeViewController: UIViewController {

    
    @IBOutlet var daysbestLabel: UILabel!
    
    @IBOutlet var weeksbestLabel: UILabel!
    
    @IBOutlet var monthsbestLabel: UILabel!
    
    @IBOutlet var chartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameInstance = GameInstance()
        gameInstance.updateLocalData()
        
        daysbestLabel.text = "\(gameInstance.dayliHighScore[0]) / \(gameInstance.dayliHighScore[2])"
        
        weeksbestLabel.text = "\( gameInstance.weeklyHighscore[0] ) / \( gameInstance.weeklyHighscore[2] )"
        
        weeksbestLabel.text = "\( gameInstance.monthlyHighScore[0] ) / \( gameInstance.monthlyHighScore[2] )"
        
        // show charts
        chartView.noDataText = "No scores are yet saved to display."
        if (gameInstance.latestScores[gameInstance.latestScores.count-1] != 0 ){
            setChart(xvalues, values: gameInstance.latestScores)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonAction(sender: TINavButton) {
        let menuvc = self.storyboard?.instantiateViewControllerWithIdentifier("idMenuViewController") as! MenuViewController
        self.presentViewController(menuvc, animated: true, completion: nil)
        
    }
    
    let xvalues : [String]! = ["a", "b", "c", "d", "e", "f", "g"]

    func setChart(dataPoints: [String], values: [Int]) {
        chartView.noDataText = "You need to provide data for the chart"
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = BarChartDataEntry(value: Double(values[i]), xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        let chartData = BarChartData(xVals: xvalues, dataSet: chartDataSet)
        chartView.data = chartData
        chartView.descriptionText = ""
        chartDataSet.colors = [UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        //chartDataSet.drawValuesEnabled = false // to hide top values
        chartDataSet.valueColors = [UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        //barChartView.xAxis.axisMinValue = 0
        
        
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawLabelsEnabled = false
        chartView.xAxis.labelWidth = 3
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = UIColor.whiteColor()
        chartView.xAxis.axisLineColor = UIColor.whiteColor()
        chartView.xAxis.labelPosition = .Bottom
        
        
        chartView.rightAxis.enabled = false
        
        //barChartView.xAxis.labelTextColor = UIColor.whiteColor()
        
        chartView.drawBarShadowEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.enabled = true
        chartView.leftAxis.axisLineColor = UIColor.whiteColor()
        chartView.leftAxis.labelTextColor = UIColor.whiteColor()
        chartView.leftAxis.labelCount = 4
        chartView.leftAxis.axisLineWidth = 1
        chartView.legend.enabled = false
        
        chartView.animate(xAxisDuration: 0.0, yAxisDuration: 2.0, easingOptionX: .Linear, easingOptionY: .EaseOutExpo)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
