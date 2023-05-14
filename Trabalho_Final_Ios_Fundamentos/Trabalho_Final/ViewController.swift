//
//  ViewController.swift
//  Trabalho_Final
//
//  Created by user239587 on 5/13/23.
//

import UIKit

class Items {
    var name: String?
    var description: String?
    
    init(name:String, description:String){
        self.name = name
        self.description = description
    }
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let tblListItems = UITableView()
    
    var itemsArray = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item0 = Items(name: "NBA 2K22", description: "Gods Among Us!")
        itemsArray.append(item0)
        let item1 = Items(name: "Injustice 2", description: "Gods Among Us!")
        itemsArray.append(item1)
        let item2 = Items(name: "Batman: Arkham Knight", description: "!")
        itemsArray.append(item2)
        let item3 = Items(name: "Grand Theft Auto V", description: "Retorno de Cratos e seu filho!")
        itemsArray.append(item3)
        setupView()
        view.addSubview(tblListItems)
        tblListItems.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblListItems.isScrollEnabled = true
        
        tblListItems.delegate = self
        tblListItems.dataSource = self    }
    
    func setupView(){
        view.backgroundColor = .white
        self.title = "Mais baixados Maio 2023!"
    }
    
    override func viewDidLayoutSubviews() {
        //Para ocupar toda a view usa esse bounds...
        //tableView.frame = view.bounds
        
        tblListItems.translatesAutoresizingMaskIntoConstraints = false
        
        //tableView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tblListItems.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        tblListItems.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tblListItems.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tblListItems.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.529).isActive = true    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var indice = String(indexPath.item + 1)
        
        cell.textLabel?.text = itemsArray[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = .cyan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.item = itemsArray[(tblListItems.indexPathForSelectedRow?.row)!]
        }
    }
}
