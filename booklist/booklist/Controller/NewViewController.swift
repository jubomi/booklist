//
//  NewViewController.swift
//  booklist
//
//  Created by 김선우 on 2022/01/24.
//

import UIKit
import Kingfisher

class NewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var bookList: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        loadData()
    }

    func loadData() {
        var urlRequest = URLRequest(url: .init(string: "https://api.itbook.store/1.0/new")!)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            guard let data = data else { return }

            guard let bookResponse = try? JSONDecoder().decode(BookResponse.self, from: data) else { return }

//            print(bookResponse)
            DispatchQueue.main.async {
                self.bookList = bookResponse.books
                self.tableView.reloadData()
            }

        }
        .resume()
    }
}

extension NewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookCell

        cell.titleLabel.text = bookList[indexPath.row].title
        let url = URL(string: bookList[indexPath.row].image)
        cell.bookImageView.kf.setImage(with: url)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(bookList[indexPath.row]) 눌렸다!!!!")
    }

}


class BookCell: UITableViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

}
