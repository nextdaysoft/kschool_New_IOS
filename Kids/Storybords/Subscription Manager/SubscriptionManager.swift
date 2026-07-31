//
//  SubscriptionManager.swift
//  KSchool
//
//  Created by Koshal Singh on 04/05/26.
//

import Foundation
import StoreKit

class SubscriptionManager {

    static let shared = SubscriptionManager()

    private init(){}

    var products:[Product] = []

    let productIDs = [
        "com.kschool.monthly",
        "com.kschool.quarterly",
        "com.kschool.yearly"
    ]

    func fetchProducts(completion:@escaping()->Void){

        Task {

            do{

                self.products = try await Product.products(for: productIDs)

                DispatchQueue.main.async {
                    completion()
                }

            }catch{
                print(error)
            }
        }
    }

    func purchase(product: Product, completion: @escaping(Bool)->Void) {

        Task {

            do {

                let result = try await product.purchase()

                switch result {

                case .success(let verification):

                    switch verification {

                    case .verified(_):

                        var days = 30

                        if product.id == "com.kschool.monthly" {
                            days = 30
                        } else if product.id == "com.kschool.quarterly" {
                            days = 90
                        } else if product.id == "com.kschool.yearly" {
                            days = 365
                        }

                        let expiryDate = Calendar.current.date(
                            byAdding: .day,
                            value: days,
                            to: Date()
                        )

                        UserDefaults.standard.set(
                            expiryDate,
                            forKey: "subscriptionExpiry"
                        )

                        DispatchQueue.main.async {
                            completion(true)
                        }

                    case .unverified(_, _):

                        DispatchQueue.main.async {
                            completion(false)
                        }
                    }

                default:

                    DispatchQueue.main.async {
                        completion(false)
                    }
                }

            } catch {

                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    func isSubscribed()->Bool{

        guard let expiry = UserDefaults.standard.object(
            forKey: "subscriptionExpiry"
        ) as? Date else {

            return false
        }

        return expiry > Date()
    }
}


