/*
 
 ViewController.swift Challenge5 Handle JSON with Good UI Created by Ahmed Shaban on 17/08/2022.
 
 FUTURE GOALS:
 - Share button
 - Add Contact button and save()
 - Edit contact
 - Contact image
 
 - there was a big problem, rows were unordered because of using dictionaries, converted them into [String]() easier . .. .
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
        parseJSON(fileName: "data", fileType: "json")
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    // JSON
    private func parseJSON(fileName: String, fileType: String) {
        guard let path = Bundle.main.path(forResource: fileName,ofType: fileType) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let Data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self,from: Data)
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
        
        var basic = [String]()
        var address = [String]()
        var phone = [String]()

        if let person = result?.data[indexPath.row] {
             basic = [
                "First Name: \(person.firstName)",
                "Last Name: \(person.lastName)",
                "Age: \(person.age)",
                "Gender: \(person.gender)"
            ]
            address = [
                "City:  \(person.address.city)",
                "State: \(person.address.state)",
                "Postal Code: \(person.address.postalCode)",
                "Street Address: \(person.address.streetAddress)"
            ]
            phone = [
                "Type: \(person.phoneNumbers[0].type)",
                "Number: \(person.phoneNumbers[0].number)"
            ]
        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailView {
            vc.basic = basic
            vc.address = address
            vc.phone = phone
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
    
    

}

