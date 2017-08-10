//
//  SettingDisplayViewController.swift
//  OriginalApplication
//
//  Created by Takakura 高倉 優介 on 2017/08/06.
//  Copyright © 2017年 DesMatsue. All rights reserved.
//

import UIKit

class SettingDisplayViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var lightPink: UIButton!
    @IBOutlet weak var pink: UIButton!
    @IBOutlet weak var purple: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var brown: UIButton!
    @IBOutlet weak var lightGreen: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var gray: UIButton!
    let userDefaults = UserDefaults.standard
    fileprivate var color:UIColor?
    
    /* button Push Events
     *
     */
    @IBAction func buttoRightPink(_ sender: Any) {
        refreshBorders()
        lightPink.layer.borderWidth = 1
        self.color = lightPink.backgroundColor
        save()
    }
    @IBAction func buttonPink(_ sender: Any) {
        refreshBorders()
        pink.layer.borderWidth = 1
        self.color = pink.backgroundColor
        save()
    }
    @IBAction func buttonPurple(_ sender: Any) {
        refreshBorders()
        purple.layer.borderWidth = 1
        self.color = purple.backgroundColor
        save()
    }
    @IBAction func buttonYellow(_ sender: Any) {
        refreshBorders()
        yellow.layer.borderWidth = 1
        self.color = yellow.backgroundColor
        save()
    }
    @IBAction func buttonRed(_ sender: Any) {
        refreshBorders()
        red.layer.borderWidth = 1
        self.color = red.backgroundColor
        save()
    }
    @IBAction func buttonBrown(_ sender: Any) {
        refreshBorders()
        brown.layer.borderWidth = 1
        self.color = brown.backgroundColor
        save()
    }
    @IBAction func buttonLightGreen(_ sender: Any) {
        refreshBorders()
        lightGreen.layer.borderWidth = 1
        self.color = lightGreen.backgroundColor
        save()
    }
    @IBAction func buttonGreen(_ sender: Any) {
        refreshBorders()
        green.layer.borderWidth = 1
        self.color = green.backgroundColor
        save()
    }
    @IBAction func buttonGray(_ sender: Any) {
        refreshBorders()
        gray.layer.borderWidth = 1
        self.color = gray.backgroundColor
        save()
    }

    /* viewDidLoad
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // selection effect
        lightPink.layer.borderColor = UIColor.blue.cgColor
        pink.layer.borderColor = UIColor.blue.cgColor
        purple.layer.borderColor = UIColor.blue.cgColor
        yellow.layer.borderColor = UIColor.blue.cgColor
        red.layer.borderColor = UIColor.blue.cgColor
        brown.layer.borderColor = UIColor.blue.cgColor
        lightGreen.layer.borderColor = UIColor.blue.cgColor
        green.layer.borderColor = UIColor.blue.cgColor
        gray.layer.borderColor = UIColor.blue.cgColor
        
        // get UIColor UserDefault
        if let storedData = userDefaults.object(forKey: "data") as? Data{
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? UserSettings{
                if let color = unarchivedData.color{
                    self.color = color
                }else{
                    color = UserSettings().color!
                }
            }else{
                color = UserSettings().color!
            }
        }else{
            color = UserSettings().color!
        }
        
        setTextColor()
    }

    func setTextColor(){
        textLabel.textColor = color
    }
    
    // save UIColor
    func save() {
        setTextColor()
        let data = UserSettings()
        data.color = self.color
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(archiveData,forKey: "data")
        userDefaults.synchronize()
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
    
    
    // reset borderEidth
    func refreshBorders(){
        lightPink.layer.borderWidth = 0
        pink.layer.borderWidth = 0
        purple.layer.borderWidth = 0
        yellow.layer.borderWidth = 0
        red.layer.borderWidth = 0
        brown.layer.borderWidth = 0
        lightGreen.layer.borderWidth = 0
        green.layer.borderWidth = 0
        gray.layer.borderWidth = 0
    }

}
