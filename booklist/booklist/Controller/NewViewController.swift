//
//  NewViewController.swift
//  booklist
//
//  Created by 주보미 on 2022/01/24.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension NewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BookCell else {
            return .init()
        }
        cell.titleLabel.text = "BookCell \(indexPath.row)"
        return cell
    }
    
    
}

class BookCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
}
