//
//  ViewController.swift in Teki
//  Using Swift 5.0
//  Created by Alexis Faure on 05/06/2022.
//  https://github.com/FaureAlexis
//  © 2022
//

import UIKit

func getRandomColor() -> UIColor {
     //Generate between 0 to 1
     let red:CGFloat = CGFloat(drand48())
     let green:CGFloat = CGFloat(drand48())
     let blue:CGFloat = CGFloat(drand48())

     return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}

class ViewController: UIViewController {
    // Outlet connections with components
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeText: UILabel!
    @IBOutlet var backgroundView: UIView!
    
    // Init 2 variables of Int type (number)
    var rdm: Int = 0;
    var old: Int = 0;
    
    // Init structure of 1 cocktail
    struct Cocktail: Identifiable {
        let id = UUID()
        let name: String
        let recipe: String
    }
    // Init list of strucure
    var cocktailList = [
        Cocktail(name: "Blue Lagoon", recipe: "Vodka, Curasao, Lime, Lemonade"),
        Cocktail(name: "Irish Coffee", recipe: "Whisky cream, Coffee"),
        Cocktail(name: "Tequila Sunrise", recipe: "Tequila, Orange juice, Orange, grenadine syrup"),
        Cocktail(name: "Malibu Sunrise", recipe: "Malibu, Orange Juice, Orange, grenadine syrup"),
        Cocktail(name: "JaegerBomb", recipe: "JaegerMaster liquor, Redbull"),
        Cocktail(name: "Long Island", recipe: "Tequila, Gin, Vodka, Rhum, Lime, Coca-Cola")
    ];
    
    // Action connection with button component
    @IBAction func changeRecipeButton() {
        old = rdm;
        // Assign a random number between 0 & elements number in the list
        rdm = Int.random(in: 0..<cocktailList.count);
        // Prevent getting 2x the same cocktail
        if (rdm == old) {
            rdm = Int.random(in: 0..<cocktailList.count);
        }
        // Set the labels texts
        recipeTitle.text = cocktailList[rdm].name;
        recipeText.text = cocktailList[rdm].recipe;
        // Log the action (Debug)
        print("Cocktail switched to \(cocktailList[rdm].name).");
        backgroundView.backgroundColor = getRandomColor();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

