//
//  ViewController.swift
//  Memorize
//
//  Created by Arjun Shukla on 3/24/21.
//

import UIKit

class ViewController: UITableViewController {
    private let dataSource = MemoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instantiate memory view controller")
        }
        
        let item = dataSource.item(at: indexPath.row)
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}
