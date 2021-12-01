//
//  ContactListViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 30/11/21.
//

import Contacts
import ContactsUI
import UIKit

struct Person {
    let name: String
    let id: String
    let source: CNContact
}

class ContactListViewController: UIViewController, UITableViewDataSource ,CNContactPickerDelegate, UITableViewDelegate {

    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var models = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        table.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let viewc = CNContactPickerViewController()
        viewc.delegate = self
        present(viewc, animated: true)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let name = contact.givenName + " " + contact.familyName
        let identifier = contact.identifier
            let model  = Person(
                name: name,
                id: identifier,
                source: contact
            )
        models.append(model)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        let contact = models[indexPath.row].source
        let viewc = CNContactViewController(for: contact)
        present(UINavigationController(rootViewController: viewc), animated: true, completion: nil)
    }

}
