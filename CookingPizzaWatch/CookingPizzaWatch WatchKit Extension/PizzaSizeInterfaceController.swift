//
//  PizzaSizeInterfaceController.swift
//  CookingPizzaWatch
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 20/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class PizzaSizeInterfaceController: WKInterfaceController {
    
    @IBOutlet var pizzaSizePicker: WKInterfacePicker!
    
    var sizeList: [String] = [
        "",
        "Pequeña",
        "Mediana",
        "Grande"]
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = sizeList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        pizzaSizePicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pizzaSizeItemChanged(value: Int) {
        
        //print("Stack Picker: \(sizeList[value]) selected.")
        defaults.setValue(sizeList[value], forKey: "selected-size")
        
        
        
    }
}
