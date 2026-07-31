//
//  BaseViewController.swift
//  KSchool
//
//  Created by Koshal Singh on 06/07/26.
//

import UIKit

class BaseViewController: UIViewController {

    private var noInternetView: NoInternetView?

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkChanged(_:)),
            name: .networkStatusChanged,
            object: nil
        )

        if !NetworkMonitor.shared.isConnected {

            showNoInternet()
        }
    }

    deinit {

        NotificationCenter.default.removeObserver(self)
    }

    @objc
    func networkChanged(_ notification: Notification) {

        guard let connected = notification.object as? Bool else { return }

        if connected {

            hideNoInternet()

        } else {

            showNoInternet()
        }
    }

    func showNoInternet() {

        guard noInternetView == nil else { return }

        let internet = NoInternetView(frame: view.bounds)

        internet.translatesAutoresizingMaskIntoConstraints = false

        internet.retryHandler = { [weak self] in
            if NetworkMonitor.shared.isConnected {
                self?.hideNoInternet()
            }
        }

        view.addSubview(internet)

        NSLayoutConstraint.activate([
            internet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            internet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            internet.topAnchor.constraint(equalTo: view.topAnchor),
            internet.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        noInternetView = internet
    }

    func hideNoInternet() {

        noInternetView?.removeFromSuperview()

        noInternetView = nil
    }
}
