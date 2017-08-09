//
//  Settings.swift
//  tippy
//
//  Created by Omid Sharghi on 8/13/17.
//  Copyright © 2017 Omid Sharghi. All rights reserved.
//

import Foundation

class Settings{
    
    init() {
        
        loadSavedValues()
        
    }
    
    static var settings: Settings? = nil
    var defaultTip: Int = 0
    var defaultColor: Int = 0
    var lastTipIndex: Int = 0
    var billValue: Double = 0.00
    var tipValue: Double = 0.00
    var totalValue: Double = 0.00
    var date: Date?
    
    func loadSavedValues()
    {
        if shoudLoadSavedValues()
        {
            let defaults = UserDefaults.standard
            billValue = defaults.double(forKey: "bill_amount")
            tipValue = defaults.double(forKey: "tip_amount")
            totalValue = defaults.double(forKey: "total_amount")
            lastTipIndex = defaults.integer(forKey: "last_tip_amount")
            defaultTip = defaults.integer(forKey: "default_tip")
            defaultColor = defaults.integer(forKey: "color")
            
            print(defaultTip)
            print(defaultColor)
        }
        
    }
    
    func shoudLoadSavedValues() -> Bool
    {
        let defaults = UserDefaults.standard

        if (defaults.object(forKey: "date") as? Date != nil)
        {
            let preDate = defaults.object(forKey: "date") as! Date
            let newDate = Date()
            
            let seconds = newDate.timeIntervalSince(preDate)
            let mins = seconds / 60
            if mins<10
            {
                return true
            }
            else
            {
                return false
            }
        }
        return false
    }
    
    func saveColor(colorIndex: Int)
    {
        print(colorIndex)
        
        let defaults = UserDefaults.standard
        defaults.set(colorIndex, forKey:"color")
        defaults.synchronize()
    }
    
    func saveTip(tipIndex: Int)
    {
        let defaults = UserDefaults.standard
        defaults.set(tipIndex, forKey:"default_tip")
        defaults.set(tipIndex, forKey:"last_tip_amount")
        defaults.synchronize()
    }
    
    func saveCalcValues()
    {
        print(lastTipIndex)
        print(defaultColor)
        
        let defaults = UserDefaults.standard
        defaults.set(billValue, forKey: "bill_amount")
        defaults.set(tipValue, forKey: "tip_amount")
        defaults.set(totalValue, forKey: "total_amount")
        defaults.set(lastTipIndex, forKey: "last_tip_amount")
        defaults.set(date, forKey:"date")
        defaults.synchronize()
        
    }
}
