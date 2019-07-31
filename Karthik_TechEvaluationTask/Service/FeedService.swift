//
//  FeedService.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire

class FeedService: BaseService {
    
    func getFeed(parameters: Parameters) ->  Future<Data>  {
        return serviceRequestFuture(path: GET_FEED, method: .get, parameters: parameters, isJson: false, header: sessionHeader())
    }
    func register(parameters: Parameters) ->  Future<Data>  {
        return serviceRequestFuture(path: POST_CONCERN, method: .post, parameters: parameters, isJson: true, header: sessionHeader())
    }
}
