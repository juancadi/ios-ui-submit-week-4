//
//  PizzaOrderInterfaceController.swift
//  CookingPizzaWatch
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 21/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class PizzaOrderInterfaceController: WKInterfaceController {
    
    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    
    @IBOutlet var pizzaOrderBtn: WKInterfaceButton!

    @IBOutlet var pizzaOrderImg: WKInterfaceImage!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var isOrderConfirmed = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if isOrderConfirmed {
            
            self.pizzaOrderImg.setImageNamed("after-order-pizza.png")
        }else{
            
            self.pizzaOrderImg.setImageNamed("before-order-pizza.png")
        
        }
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func confirmPizzaOrder() {
        
        let storagedSize: String? = defaults.stringForKey("selected-size")
        let storagedDough: String? = defaults.stringForKey("selected-dough")
        let storagedCheese: String? = defaults.stringForKey("selected-cheese")
        let storagedIngredients: [String]? = defaults.stringArrayForKey("selected-ingredients")
        
        if validatePizzaSteps(storagedSize, dough: storagedDough, cheese: storagedCheese, ingredients: storagedIngredients){
            
            self.pizzaOrderImg.setImageNamed("after-order-pizza.png")
            
            let duration = 0.5
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64((duration + 0.2) * Double(NSEC_PER_SEC)))
            self.backgroundGroup.setBackgroundImageNamed("Progress")
            self.backgroundGroup.startAnimatingWithImagesInRange(NSRange(location: 0, length: 10), duration: duration, repeatCount: 1)
            
            dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
                
                let cancel = WKAlertAction(title: "Cancelar", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                    
                    self.isOrderConfirmed = false
                    
                })
                
                let action = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in
                    
                    self.isOrderConfirmed = true
                    self.dismissController()
                    
                })
                
                self.presentAlertControllerWithTitle("Buena elección...", message: "Tu pizza \(storagedSize!.lowercaseString) con masa \(storagedDough!.lowercaseString), queso \(storagedCheese!.lowercaseString) y \(storagedIngredients!.joinWithSeparator(", ").lowercaseString) esta lista para enviar a la cocina... Confirmas la orden?", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
                
            }
            
            
        }else{
            
            let cancel = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                
            })
            
            self.presentAlertControllerWithTitle("Upss...", message: "Tu orden esta incompleta, por favor regresa, y verifica tu pedido.", preferredStyle: WKAlertControllerStyle.Alert, actions: [cancel])
        
        }
        
        
    }
    
    func validatePizzaSteps(size: String?, dough: String?, cheese: String?, ingredients: [String]?) -> Bool {
        
        var validationResult = false
        
        
        //print("Size: \(size!)")
        //print("Dough: \(dough!)")
        //print("Cheese: \(cheese!)")
        //print("Ingredients: \(ingredients!.joinWithSeparator(", "))")
        
        if size != nil && dough != nil && cheese != nil && ingredients != nil
        {
        
            if size! != "" && dough! != "" && cheese! != "" && ingredients!.count > 0
            {
                validationResult = true
            }
        }
        
        return validationResult
    }
    
}
