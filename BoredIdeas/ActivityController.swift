//
//  ActivityController.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 21.10.2023.
//

import UIKit
import RealmSwift

class Once {

  var already: Bool = false

  func run(block: () -> Void) {
    guard !already else { return }

    block()
    already = true
  }
}
class ActivityController: UIViewController {
    let once = Once()
    let realm = try! Realm()
    
    @IBOutlet weak var infoActivity: UILabel!
    @IBOutlet weak var textActivity: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    

    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let activityRealm = ActivityRealm()
        
        try! realm.write{
            activityRealm.activity = UserDefaults.standard.string(forKey: "activity")
            activityRealm.activityId = UserDefaults.standard.string(forKey: "activityId")
            realm.add(activityRealm)
            if (UserDefaults.standard.array(forKey: "activityArraySaved") != nil){
                var newArray = UserDefaults.standard.array(forKey: "activityArraySaved")
                newArray?.append(UserDefaults.standard.string(forKey: "activity") ?? "None")
                UserDefaults.standard.set(newArray, forKey: "activityArraySaved")
            }
            else
            {
                var newArray = [String]()
                newArray.append(UserDefaults.standard.string(forKey: "activity") ?? "None")
                UserDefaults.standard.set(newArray, forKey: "activityArraySaved")
            }
        }
        saveButton.isEnabled = false
    }
    
    @IBAction func requestButton(_ sender: UIButton) {
        sendRequest()
        if self.textActivity.text != "No type selected!" && 
            self.textActivity.text != "HTTP Request Failed"{
            saveButton.isHidden = false
            saveButton.isEnabled = true
        }
        else
        {
            saveButton.isHidden = true
            saveButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        once.run{
            UserDefaults.standard.set(true, forKey: "educationSwitch")
            UserDefaults.standard.set(true, forKey: "recreationalSwitch")
            UserDefaults.standard.set(true, forKey: "socialSwitch")
            UserDefaults.standard.set(true, forKey: "diySwitch")
            UserDefaults.standard.set(true, forKey: "charitySwitch")
            UserDefaults.standard.set(true, forKey: "relaxationSwitch")
            UserDefaults.standard.set(true, forKey: "musicSwitch")
            UserDefaults.standard.set(true, forKey: "busyworkSwitch")
        }
        
        let activities = realm.objects(ActivityRealm.self)
        if !activities.isEmpty{
            var activityArray = [String]()
            
            for activs in activities {
                activityArray.append(activs.activity ?? "None")
            }
            if !activityArray.isEmpty {
                UserDefaults.standard.set(activityArray, forKey: "activityArraySaved")
            }
        }
            
    }
    
    private func setType() -> String{
        var types: Set = ["education","recreational","social","diy","charity","relaxation","music","busywork"]
        
        if !UserDefaults.standard.bool(forKey: "educationSwitch"){
            types.remove("education")
        }
        
        if !UserDefaults.standard.bool(forKey: "recreationalSwitch"){
            types.remove("recreational")
        }
        if !UserDefaults.standard.bool(forKey: "socialSwitch"){
            types.remove("social")
        }
        if !UserDefaults.standard.bool(forKey: "diySwitch"){
            types.remove("diy")
        }
        if !UserDefaults.standard.bool(forKey: "charitySwitch"){
            types.remove("charity")
        }
        if !UserDefaults.standard.bool(forKey: "relaxationSwitch"){
            types.remove("relaxation")
        }
        if !UserDefaults.standard.bool(forKey: "musicSwitch"){
            types.remove("music")
        }
        if !UserDefaults.standard.bool(forKey: "busyworkSwitch"){
            types.remove("busywork")
        }
        if types.isEmpty
        {
            return "Empty"
        }
        else
        {
            let rand = types.randomElement() ?? "Empty"
            return rand
        }
    }
    
    private func sendRequest(){
        
        self.textActivity.text = ""
        self.infoActivity.text = ""
        let type = setType()
        if type == "Empty"
        {
            self.textActivity.text = "No type selected!"
            self.infoActivity.text = "Please change your settings"
        }
        else
        {
            let path = "https://www.boredapi.com/api/activity?type=" + type
            let request = URLRequest(url: URL(string:path)!)
            let task = URLSession.shared.dataTask(with: request){
                (data, responce, error) in
                if let data = data {
                    //print(String(data:data,encoding: .utf8)!)
                    let activity = try! JSONDecoder().decode(Activity.self, from: data)
                    DispatchQueue.main.async{
                        self.textActivity.text! += activity.activity as String? ?? "None"
                        self.infoActivity.text! += "Type: " + (activity.type as String? ?? "None")
                        
                        UserDefaults.standard.set(self.textActivity.text, forKey: "activity")
                        UserDefaults.standard.set(activity.key, forKey: "activityId")
                    }
                } else if let error = error {
                    self.textActivity.text! = "HTTP Request Failed"
                }
                
            }
            task.resume()
        }
    }

}
