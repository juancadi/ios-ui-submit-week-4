//
//  InterfaceController.swift
//  CookingPizzaWatch WatchKit Extension
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 20/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func startOrder() {
        
        let controllers = ["PizzaSize", "PizzaDough", "PizzaCheese", "PizzaIngredients",
            "PizzaOrder"]
        presentControllerWithNames(controllers, contexts:nil)
        
        
        
    }
}
