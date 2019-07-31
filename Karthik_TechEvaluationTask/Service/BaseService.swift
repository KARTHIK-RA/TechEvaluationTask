//
//  BaseService.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire

typealias ServiceResponse = (Bool, Data?, String?) -> Void

class BaseService {
    func sessionHeader() -> [String: String] {
        return   ["consumer-key": String(format: "%@",  Config.shared.consumerKey) , "consumer-secret" : Config.shared.consumerSecret ]
    }
    
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
    
    func serviceRequestFuture(path: String, method: HTTPMethod, parameters: Parameters, isJson: Bool, header: [String : String]?=nil) -> Future<Data> {
        
        let promise = Promise<Data>()
        var headers: [String : String] = header ?? [:]
        guard let url = try? path.asURL() else {
            promise.reject(with: "Invalid URL")
            return promise
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        if isJson {
            guard let data = try? JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted) else {
                promise.reject(with: "Invalid Json paramater")
                return promise
            }
            if let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                urlRequest.httpBody = json.data(using: String.Encoding.utf8.rawValue)!
            }
            headers["Content-Type"] = "application/json"
        } else {
            urlRequest = try! URLEncoding.default.encode(urlRequest, with: parameters)
        }
        urlRequest.allHTTPHeaderFields = headers
        return URLSession.shared.request(url: urlRequest)
        
    }
    
}
