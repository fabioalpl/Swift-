//
//  DetailViewController.swift
//  Trabalho_Final
//
//  Created by user239587 on 5/13/23.
//

import UIKit

class DetailViewController: UIViewController {

    var item: Items?
    
    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var name = item?.name!

        lblItem.text = "\(name) possui as seguintes caracteristicas: "
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
