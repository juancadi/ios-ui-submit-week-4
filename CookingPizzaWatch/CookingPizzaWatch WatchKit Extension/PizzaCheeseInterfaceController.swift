//
//  PizzaCheeseInterfaceController.swift
//  CookingPizzaWatch
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 20/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class PizzaCheeseInterfaceController: WKInterfaceController {
    
    @IBOutlet var pizzaCheesePicker: WKInterfacePicker!
    var cheeseList: [String] = [
        "",
        "Mozarella",
        "Cheddar",
        "Parmesano",
        "Sin Queso"]
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = cheeseList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        pizzaCheesePicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pizzaCheeseItemChanged(value: Int) {
        
        //print("Stack Picker: \(cheeseList[value]) selected.")
        defaults.setValue(cheeseList[value], forKey: "selected-cheese")
        
        
    }

}
