//
//  FeedAgent.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
protocol FeedAgentProtocol {
    func getFeedList() -> Future<FeedListResponse>?
    func register(eid: String, name: String, idbarahno: String, emailaddress: String, unifiednumber: String, mobilNo: String) -> Future<ConcernResponse>?
}

class FeedAgent: BaseAgent {
    // MARK:- Class Properties
    static let feedOnlineAgent = FeedOnlineAgent()
    // MARK:- Get instance for online or mock agent
    static func getInstance() -> FeedAgentProtocol {
        return feedOnlineAgent
    }
    
    func getFeedList() -> Future<FeedListResponse>? {
        return nil
    }
    func register(eid: String, name: String, idbarahno: String, emailaddress: String, unifiednumber: String, mobilNo: String) -> Future<ConcernResponse>? {
        return nil
    }
}

class FeedOnlineAgent: BaseAgent, FeedAgentProtocol {
    
    func getFeedList() -> Future<FeedListResponse>? {
        let  sevice = FeedService()
        let promise = Promise<FeedListResponse>()
        var parameter: [String: Any] = [:]
        parameter["local"] = "en"
        let requestFuture =  sevice.getFeed(parameters: parameter)
        requestFuture.observe { result in
            switch result {
            case .value(let value):
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(FeedListResponse.self, from: value)
                    promise.resolve(with: user)
                } catch let err{
                    promise.reject(with: err.localizedDescription)
                }
            case .error(let error):
                promise.reject(with: error)
            }
        }
        return promise
    }

    func register(eid: String, name: String, idbarahno: String, emailaddress: String, unifiednumber: String, mobilNo: String) -> Future<ConcernResponse>? {
        let  sevice = FeedService()
        let promise = Promise<ConcernResponse>()
        var parameter: [String: Any] = [:]
        parameter["eid"] = eid
        parameter["name"] = name
        parameter["idbarahno"] = idbarahno
        parameter["emailaddress"] = emailaddress
        parameter["unifiednumber"] = unifiednumber
        parameter["mobileno"] = mobilNo
        parameter["local"] = "en"
        let requestFuture =  sevice.register(parameters: parameter)
        requestFuture.observe { result in
            switch result {
            case .value(let value):
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(ConcernResponse.self, from: value)
                    promise.resolve(with: user)
                } catch let err{
                    promise.reject(with: err.localizedDescription)
                }
            case .error(let error):
                promise.reject(with: error)
            }
        }
        return promise
    }

}
