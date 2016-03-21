//
//  PizzaDoughInterfaceController.swift
//  CookingPizzaWatch
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 20/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class PizzaDoughInterfaceController: WKInterfaceController {

    @IBOutlet var pizzaDoughPicker: WKInterfacePicker!
    
    var doughList: [String] = [
        "",
        "Delgada",
        "Crujiente",
        "Gruesa"]
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = doughList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        pizzaDoughPicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pizzaDoughItemChanged(value: Int) {
        
        //print("Stack Picker: \(doughList[value]) selected.")
        defaults.setValue(doughList[value], forKey: "selected-dough")
        
        
    }

}
