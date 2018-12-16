//
//  TableViewController.swift
//  UISearchController
//
//  Created by Chhaileng Peng on 12/16/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data = ["Dara", "Daro", "Dary", "Channat", "Ratanak", "Reksmey", "Sok", "Sokha", "Sao"]
    
    var filteredData = [String]()
    
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredData = data
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.searchBar.placeholder = "Search name"
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.setValue("បោះបង់ 😂", forKey: "_cancelButtonText")
//        tableView.tableHeaderView = searchController?.searchBar
        navigationItem.titleView = searchController?.searchBar
        
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = filteredData[indexPath.row]

        return cell
    }
}

extension TableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text != "" {
            filteredData = data.filter({ (name) -> Bool in
                return name.lowercased().contains(searchController.searchBar.text!.lowercased())
            })
        } else {
            filteredData = data
        }
        tableView.reloadData()
    }
    
}
