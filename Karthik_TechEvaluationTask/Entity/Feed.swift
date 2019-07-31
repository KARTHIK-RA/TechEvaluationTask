//
//  Feed.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct FeedListResponse : Decodable {
    var success: Bool
    var payload: [Feed]?  = [Feed]()
    var message:String?
}

struct ConcernResponse : Decodable {
    var success: Bool
    var payload: Reference?
    var message:String
}

struct Reference : Decodable{
    var referenceNo: Int
}

struct Feed : Decodable{
    var title: String
    var description: String
    var date: String
    var image: String
}
