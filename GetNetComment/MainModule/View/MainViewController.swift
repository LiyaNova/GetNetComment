//
//  MainViewController.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "GetNetComment"
    }
}


//MARK: -
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = comment?.email
        cell.contentConfiguration = content
        return cell
    }
}

//MARK: -
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        presenter.tapOnTheComment(comment: comment)
    }

}
// MARK: -

extension MainViewController: MainViewProtocol {

    func succes() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
