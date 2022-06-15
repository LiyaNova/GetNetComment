//
//  MainViewPresenter.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    func tapOnTheComment(comment: Comment?)
    var comments: [Comment]? { get set }
}

class MainViewPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    var router: RouterProtocol
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func tapOnTheComment(comment: Comment?) {
        router.showDetailVC(comment: comment)
    }

    func getComments() {
        networkService.getComments{ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
