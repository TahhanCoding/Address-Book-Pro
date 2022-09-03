//  DetailView.swift
//  Challenge5 Handle JSON with Good UI
//  Created by Ahmed Shaban on 20/08/2022.

import UIKit

class DetailView: UITableViewController {
    
    // Properties
    var contactBasic = [String: String?]()
    var contactAddress = [String: String?]()
    var contactPhone = [String: String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TableView Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Basic"
        case 1:
            return "Address"
        case 2:
            return "Phone Numbers"
        default:
            return "Title"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsAtSection: [Int] = [4, 4, 2]
        var rows: Int = 0
        if section < numberOfRowsAtSection.count { rows = numberOfRowsAtSection[section] }
        return rows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let arrayBasic = contactBasic.flatMap({ (key, value) -> [String] in
            let string = key + (value ?? "value")
            return [string] 
            })
            cell.textLabel?.text = arrayBasic[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let arrayBasic = contactAddress.flatMap({ (key, value) -> [String] in
            let string = key + (value ?? "value")
            return [string]
            })
            cell.textLabel?.text = arrayBasic[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let arrayBasic = contactPhone.flatMap({ (key, value) -> [String] in
            let string = key + (value ?? "value")
            return [string]
            })
            cell.textLabel?.text = arrayBasic[indexPath.row]
            return cell
        }
        
    }
    
    
    
    
    
}
