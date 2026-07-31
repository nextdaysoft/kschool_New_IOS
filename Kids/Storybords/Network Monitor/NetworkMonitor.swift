//
//  NetworkMonitor.swift
//  KSchool
//
//  Created by Koshal Singh on 06/07/26.
//

import Foundation
import Network

final class NetworkMonitor {

    static let shared = NetworkMonitor()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "InternetMonitor")

    private(set) var isConnected = true

    private init() {}

    func startMonitoring() {

        monitor.pathUpdateHandler = { path in

            DispatchQueue.main.async {

                let status = (path.status == .satisfied)

                if self.isConnected != status {

                    self.isConnected = status

                    NotificationCenter.default.post(
                        name: .networkStatusChanged,
                        object: status
                    )
                }
            }
        }

        monitor.start(queue: queue)
    }
}

extension Notification.Name {

    static let networkStatusChanged = Notification.Name("networkStatusChanged")
}
