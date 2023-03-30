//
//  DetailView.swift
//  Address Book Pro
//
//  Created by Ahmed Shaban on 20/08/2022.
//

import UIKit

class DetailView: UITableViewController {
    
    // Properties
    var basic = [String]()
    var address = [String]()
    var phone = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "AvatarCell", bundle: nil), forCellReuseIdentifier: "avatar")
//        self.tableView.dataSource = self
//        self.tableView.delegate = self

    }
    // TableView Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "Basic"
        case 2:
            return "Address"
        case 3:
            return "Phone Numbers"
        default:
            return "Title"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsAtSection: [Int] = [1, 4, 4, 2]
        var rows: Int = 0
        // Make sure that [section] finds a value.
        // if we have a 4th section, it won't find a rows number in [Int] above.
        if section < numberOfRowsAtSection.count { rows = numberOfRowsAtSection[section] }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 200
        }
        else {
            return 50
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "avatar", for: indexPath) as! AvatarCell
            let imageName = "person.png"
            let image = UIImage(named: imageName)?.circleMask
            cell.avatarImage.image = image
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = basic[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = address[indexPath.row]
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = phone[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "cell title"
            return cell
        }
    }

    
    
    
}


