//
//  FirstViewController.swift
//  Exercicio_4
//
//  Created by user239587 on 5/12/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBackgroundColorAction(_ sender: Any) {
        let oragenColor = UIColor.orange
        let mainColor = UIColor.systemCyan
        
        view.backgroundColor = view.backgroundColor == mainColor ? oragenColor : mainColor
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
