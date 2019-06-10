//
//  TaxViewController.swift
//  POS
//
//  Created by Tayson Nguyen on 2019-04-29.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation
import UIKit

protocol TaxViewControllerDelegate: class {
    func taxViewControllerDoneTapped()
}

class TaxViewController: UITableViewController {
    let cellIdentifier = "Cell"
    
    weak var delegate: TaxViewControllerDelegate?
    let viewModel = TaxViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Taxes"
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func done() {
        delegate?.taxViewControllerDoneTapped()
        dismiss(animated: true, completion: nil)
    }
}

extension TaxViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(for: section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
        
        cell.textLabel?.text = viewModel.labelForTax(at: indexPath)
        cell.accessoryType = viewModel.accessoryType(at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggleTax(at: indexPath)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

class TaxViewModel {
    func title(for section: Int) -> String {
        return "Taxes"
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return taxes.count
    }
    
    func labelForTax(at indexPath: IndexPath) -> String {
        let tax = taxes[indexPath.row]
        return tax.descriptionText
    }
    
    func accessoryType(at indexPath: IndexPath) -> UITableViewCell.AccessoryType {
        let tax = taxes[indexPath.row]
        return tax.isEnabled ? .checkmark : .none
    }
    
    func toggleTax(at indexPath: IndexPath) {
        taxes[indexPath.row].isEnabled = !taxes[indexPath.row].isEnabled
    }
}
