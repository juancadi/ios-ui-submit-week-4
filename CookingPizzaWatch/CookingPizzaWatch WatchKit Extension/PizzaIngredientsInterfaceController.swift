//
//  PizzaIngredientsInterfaceController.swift
//  CookingPizzaWatch
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 20/03/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import WatchKit
import Foundation


class PizzaIngredientsInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var ingredientsTable: WKInterfaceTable!
    
    @IBOutlet var ingredientsCountLbl: WKInterfaceLabel!
    
    var pizzaIngredients:[String] = [
        "Jamón", "Pepperoni", "Pavo", "Salami", "Aceitunas", "Cebolla", "Pimienta", "Piña", "Anchoas"]
    
    var selectedIngredients:[String] = []
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        ingredientsTable.setNumberOfRows(pizzaIngredients.count, withRowType: "IngredientsRow")
        
        for index in 0..<ingredientsTable.numberOfRows {
            if let controller = ingredientsTable.rowControllerAtIndex(index) as? IngredientsRowController {
                controller.ingredientLbl.setText(pizzaIngredients[index])
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //Table actions
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let ingredient = pizzaIngredients[rowIndex]
        
        // Acciones para seleccionar o deseleccionar ingredientes
        if isIngredientSelected(ingredient){
            
            markRowAsUnselected(rowIndex)
            removeIngredient(ingredient)
            
        }else{
            
            if selectedIngredients.count < 5{
                
                markRowAsSelected(rowIndex)
                addIngredient(ingredient)
                
            }
            
        }
        
        ingredientsCountLbl.setText("\(selectedIngredients.count)/5")
        defaults.setValue(selectedIngredients, forKey: "selected-ingredients")
    }
    
    
    func isIngredientSelected(ingredient: String)-> Bool{
        
        var isSelected : Bool = false
        
        for selectedIngredient in selectedIngredients {
            
            if selectedIngredient == ingredient {
                
                isSelected = true
                
            }
            
        }
        
        return isSelected
    }
    
    func removeIngredient(ingredient : String){
        
        for var i=0; i<selectedIngredients.count; i++ {
            
            if selectedIngredients[i] == ingredient {
                
                selectedIngredients.removeAtIndex(i)
                
            }
        }
        
    }
    
    
    func addIngredient(ingredient : String){
        
        selectedIngredients.append(ingredient)
        
    }
    
    
    func markRowAsSelected(index:Int){
        
        if let controller = ingredientsTable.rowControllerAtIndex(index) as? IngredientsRowController {
            controller.selectedIngredientImg.setImageNamed("pizza-list-selected-icon.png")
        }
    
    }
    
    
    func markRowAsUnselected(index:Int){
        
        if let controller = ingredientsTable.rowControllerAtIndex(index) as? IngredientsRowController {
            controller.selectedIngredientImg.setImageNamed("pizza-list-icon.png")
        }
        
    }

}
