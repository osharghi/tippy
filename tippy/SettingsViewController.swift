//
//  SettingsViewController.swift
//  tippy
//
//  Created by Omid Sharghi on 8/9/17.
//  Copyright © 2017 Omid Sharghi. All rights reserved.
//

import UIKit

protocol TipSelectDelegate {
    
    func didSelectDefaultTip(indexValue: Int)
    
}

protocol ChangeColorDelegate {
    
    func changeColor(newColor: UIColor)
    
}

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipSegmentController: UISegmentedControl!
    @IBOutlet weak var colorSegmentController: UISegmentedControl!
    
    var colorOptions : [UIColor] = []
    var defaultTipDelegate: TipSelectDelegate!
    var changeColorDelegate: ChangeColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        colorOptionsArray()
        loadSavedValues()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupNavBar()
    {

        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    func colorOptionsArray()
    {
        let blueColor = UIColor(red: 0.00, green: 122.00/255.00, blue: 255.00/255.00, alpha: 1.00)
        let purpleColor = UIColor(red: 0.3725, green: 0.4156, blue: 1.0, alpha: 1.0)
        let greenColor = UIColor(red: 107/255, green: 212/255, blue: 231/255, alpha: 1.0)
        
        colorOptions = [blueColor, purpleColor, greenColor]
    }
    
    @IBAction func defaultSelected(_ sender: Any) {
        
        let defaultTip: Int?
        defaultTip = defaultTipSegmentController.selectedSegmentIndex
        print(defaultTip!)
        defaultTipDelegate.didSelectDefaultTip(indexValue: defaultTip!)
        saveSelection()

    }
    
    @IBAction func colorSwitch(_ sender: Any) {
        
        switchColor(newColor: colorOptions[colorSegmentController.selectedSegmentIndex])
        
    }
    
    func switchColor(newColor: UIColor)
    {
        view.backgroundColor = newColor
        navigationController?.navigationBar.barTintColor = newColor
        colorSegmentController.backgroundColor = newColor
        defaultTipSegmentController.backgroundColor = newColor
        saveSelection()
        changeColorDelegate.changeColor(newColor: newColor)
        
    }
    
    func loadSavedValues()
    {

        print((Settings.settings?.defaultTip)!)
        defaultTipSegmentController.selectedSegmentIndex = (Settings.settings?.defaultTip)!
        colorSegmentController.selectedSegmentIndex = (Settings.settings?.defaultColor)!
        let color : UIColor = colorOptions[(Settings.settings?.defaultColor)!]
        switchColor(newColor: color)

    }
    
    func saveSelection()
    {
        print(defaultTipSegmentController.selectedSegmentIndex)
        print(colorSegmentController.selectedSegmentIndex)
        Settings.settings?.defaultTip = defaultTipSegmentController.selectedSegmentIndex
        Settings.settings?.defaultColor = colorSegmentController.selectedSegmentIndex
        Settings.settings?.saveColor(colorIndex: colorSegmentController.selectedSegmentIndex)
        Settings.settings?.saveTip(tipIndex:defaultTipSegmentController.selectedSegmentIndex)
        
    }
    


}
