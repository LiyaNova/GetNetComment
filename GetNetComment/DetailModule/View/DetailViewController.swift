//
//  DetailViewController.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!

    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: -

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}

