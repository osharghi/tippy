//
//  ViewController.swift
//  tippy
//
//  Created by Omid Sharghi on 8/8/17.
//  Copyright © 2017 Omid Sharghi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billViewBottomConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Settings.settings = Settings()
        billViewBottomConstraint.constant = billViewBottomConstraint.constant + 200
        self.view.layoutIfNeeded()
        billField.becomeFirstResponder()
        billField.backgroundColor =  UIColor(red: 0.00, green: 122.00/255.00, blue: 255.00/255.00, alpha: 1.00)
        setUpNavBar()
        loadDefaultTipValue()
        loadLastTotal()
        loadColor()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpNavBar()
    {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.00, green: 122.00/255.00, blue: 255.00/255.00, alpha: 1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        
        let button: UIButton = UIButton(type: .custom)
        button.addTarget(self, action: #selector(ViewController.settingsPressed), for: UIControlEvents.touchUpInside)
        button.setImage(UIImage(named: "SettingsIconWhite.png"), for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
        button.adjustsImageWhenHighlighted = false        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        animate()
        
        print(tipControl.selectedSegmentIndex)
        
        let tipPercentages = [0.10, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip =  bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        saveValues(bill: bill, tip: tip, total: total, tipIndex:tipControl.selectedSegmentIndex)
    }
    
    func saveValues(bill: Double, tip: Double, total: Double, tipIndex: Int)
    {

        Settings.settings?.billValue = bill
        Settings.settings?.tipValue = tip
        Settings.settings?.totalValue = total
        print(tipIndex)
        Settings.settings?.lastTipIndex = tipIndex
        Settings.settings?.date = Date()
        Settings.settings?.saveCalcValues()
        
        
    }
    
    func settingsPressed()
    {

        self.performSegue(withIdentifier: "toSettings", sender: nil)
    }
    
    func animate()
    {
        
        if self.billViewBottomConstraint.constant != 0
        {
            self.billViewBottomConstraint.constant = self.billViewBottomConstraint.constant - 200
            
            UIView.animate(withDuration: 0.75) {

                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.defaultTipDelegate = self
        settingsVC.changeColorDelegate = self
    }
    
    
    func changeColor(color: UIColor)
    {
        view.backgroundColor = color
        tipControl.backgroundColor = color
        billView.backgroundColor = color
        billField.backgroundColor = color
        tipView.backgroundColor = color
        totalView.backgroundColor = color
        navigationController?.navigationBar.barTintColor = color
    }
    
    func loadLastTotal()
    {
        
        let bill = Settings.settings?.billValue
        let tip = Settings.settings?.tipValue
        let total = Settings.settings?.totalValue
        let lastTipIndex = Settings.settings?.lastTipIndex

        if Settings.settings?.billValue != 0.00
        {
            billField.text = String(format:"%.2f", bill!)
            tipLabel.text = String(format:"%.2f", tip!)
            totalLabel.text = String(format:"%.2f", total!)
            tipControl.selectedSegmentIndex = lastTipIndex!
            print(Settings.settings?.lastTipIndex)
            animate()
        }
        
    }
    
    func loadDefaultTipValue()
    {
        print((Settings.settings?.defaultTip)!)
        tipControl.selectedSegmentIndex = (Settings.settings?.defaultTip)!
    }
    
    func loadColor()
    {
        let blueColor = UIColor(red: 0.00, green: 122.00/255.00, blue: 255.00/255.00, alpha: 1.00)
        let purpleColor = UIColor(red: 0.3725, green: 0.4156, blue: 1.0, alpha: 1.0)
        let greenColor = UIColor(red: 107/255, green: 212/255, blue: 231/255, alpha: 1.0)
        let colorOptions = [blueColor, purpleColor, greenColor]
        
        let color : UIColor = colorOptions[(Settings.settings?.defaultColor)!]
        print((Settings.settings?.defaultColor)!)
        changeColor(newColor: color)
        
        
    }
    
}

extension ViewController: TipSelectDelegate{
    
    func didSelectDefaultTip(indexValue: Int){
        print(indexValue)
        tipControl.selectedSegmentIndex = indexValue
        calculateTip(self)
    }
    
}

extension ViewController: ChangeColorDelegate{
    
    func changeColor(newColor: UIColor) {
        self.changeColor(color: newColor)
    }
    
}

