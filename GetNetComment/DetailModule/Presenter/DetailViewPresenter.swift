//
//  DetailViewPresenter.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailViewPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

   public func setComment() {
        view?.setComment(comment: comment)
    }

    func tap() {
        router?.popToRoot()
    }
}
