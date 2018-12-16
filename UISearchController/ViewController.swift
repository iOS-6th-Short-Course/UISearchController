//
//  ViewController.swift
//  UISearchController
//
//  Created by Chhaileng Peng on 12/16/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["Dara", "Daro", "Dary", "Channat", "Ratanak", "Reksmey", "Sok", "Sokha", "Sao"]
    
    var filteredData = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        filteredData = data
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = filteredData[indexPath.row]
        return cell!
    }


}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredData = data.filter({ (name) -> Bool in
                return name.lowercased().contains(searchText.lowercased())
            })
        } else {
            filteredData = data
        }
        tableView.reloadData()
    }
    
}
