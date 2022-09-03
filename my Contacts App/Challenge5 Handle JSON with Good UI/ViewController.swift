/*
 
 ViewController.swift Challenge5 Handle JSON with Good UI Created by Ahmed Shaban on 17/08/2022.
 
 FUTURE GOALS:
 - add share button
 - add Add Contact button and save()
 - edit contact
 - add contact image
 - save contact image
 */

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var result: Result?
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        parseJSON()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    // JSON
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data",ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            print(jsonData)
            result = try JSONDecoder().decode(Result.self,from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = result?.data[indexPath.row]
        let text = "\(person?.firstName ?? "Name") \(person?.lastName ?? "Name")"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = text
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = result?.data[indexPath.row]
        let contactBasic = ["First Name:  ": person?.firstName,"Last Name: ": person?.lastName,"Age:": person?.age,"Gender: ": person?.gender]
        let contactAddress = ["City:  ": person?.address.city,"State:  ": person?.address.state,"Postal Code:  ": person?.address.postalCode,"Street Address:  ": person?.address.streetAddress]
        let contactPhone = ["Type:  ": person?.phoneNumbers[0].type,"Number:  ": person?.phoneNumbers[0].number]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailView {
            vc.contactBasic = contactBasic
            vc.contactAddress = contactAddress
            vc.contactPhone = contactPhone
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
    
    

}

