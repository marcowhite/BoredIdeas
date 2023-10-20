//
//  SettingsController.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 21.10.2023.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var educationSwitch: UISwitch!
    @IBOutlet weak var recreationalSwitch: UISwitch!
    @IBOutlet weak var socialSwitch: UISwitch!
    @IBOutlet weak var diySwitch: UISwitch!
    @IBOutlet weak var charitySwitch: UISwitch!
    @IBOutlet weak var relaxationSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var busyworkSwitch: UISwitch!
    
    

    @IBAction func educationSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "educationSwitch")
    }
    @IBAction func recreatinoalSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "recreationalSwitch")
    }
    @IBAction func socialSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "socialSwitch")
    }
    @IBAction func diySwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "diySwitch")
    }
    @IBAction func charitySwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "charitySwitch")
    }
    @IBAction func relaxationSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "relaxationSwitch")
    }
    @IBAction func musicSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "musicSwitch")
    }
    @IBAction func busyworkSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "busyworkSwitch")
    }
    
    @IBOutlet weak var acessabilitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationSwitch.isOn = UserDefaults.standard.bool(forKey: "educationSwitch")
        recreationalSwitch.isOn = UserDefaults.standard.bool(forKey: "recreationalSwitch")
        socialSwitch.isOn = UserDefaults.standard.bool(forKey: "socialSwitch")
        diySwitch.isOn = UserDefaults.standard.bool(forKey: "diySwitch")
        charitySwitch.isOn = UserDefaults.standard.bool(forKey: "charitySwitch")
        relaxationSwitch.isOn = UserDefaults.standard.bool(forKey: "relaxationSwitch")
        musicSwitch.isOn = UserDefaults.standard.bool(forKey: "musicSwitch")
        busyworkSwitch.isOn = UserDefaults.standard.bool(forKey: "busyworkSwitch")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
