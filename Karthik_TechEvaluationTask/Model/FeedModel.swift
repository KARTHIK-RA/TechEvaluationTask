//
//  FeedModel.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

typealias ModelResponse = (_ success: Bool, _ errorMsg: String?)-> Void

class FeedModel {
    private var list : [Feed] = [Feed]()
    func getFeed (completionHandler: @escaping ModelResponse ) {
        let requestFuture =  FeedAgent.getInstance().getFeedList()
        requestFuture?.observe { result in
            switch result {
            case .value(let _value):
                if _value.success {
                    self.addList(_list: _value.payload!)
                    completionHandler(true, "")
                }else {
                    completionHandler(_value.success, _value.message!)
                }
            case .error(let error):
                completionHandler(false, error as! String)
            }
        }
    }
    
    private func addList(_list: [Feed]){
        for item in _list {
            list.append(item)
        }
    }
    
    func rest()  {
        list.removeAll()
    }
    
    func getItemByIntex(intex: Int) -> Feed? {
        if intex < getFeedCount() {
            return list[intex]
            
        }
        return nil
    }
    func getFeedCount() -> Int {
        return list.count
    }
}


class RegisterModel {
    
    func register(eid: String, name: String, idbarahno: String, emailaddress: String, unifiednumber: String, mobilNo: String, completionHandler: @escaping ModelResponse) {
        let requestFuture =  FeedAgent.getInstance().register(eid: eid, name: name, idbarahno: idbarahno, emailaddress: emailaddress, unifiednumber: unifiednumber, mobilNo: mobilNo)
        requestFuture?.observe { result in
            switch result {
            case .value(let _value):
                completionHandler(_value.success, _value.message)
            case .error(let error):
                completionHandler(false, error as! String)
            }
        }
    }
}
