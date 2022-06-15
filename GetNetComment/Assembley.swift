//
//  Assembley.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
     func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
     func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
         let presenter = MainViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }

     func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
         let presenter = DetailViewPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}
