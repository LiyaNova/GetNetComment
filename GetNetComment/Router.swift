//
//  Router.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assembly: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initViewController()
    func showDetailVC(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assembly: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController?, assembly: AssemblyBuilderProtocol?) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func initViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assembly?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailVC(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewController = assembly?.createDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

