//
//  FeedViewModel.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

@objc protocol BaseVCProtocol {
    @objc optional func showLoadingIndicator()
    @objc optional func hideLoadingIndicator()
    @objc optional func showAlert(msg: String)
}


protocol FeedListProtocol: BaseVCProtocol {
    func reloadData()
    func didReset()
}


class FeedViewModel {
    let model: FeedModel = FeedModel()
    var delegate: FeedListProtocol!
    
    func getFeedList()  {
        delegate.showLoadingIndicator?()
        model.getFeed {(status, message) in
            DispatchQueue.main.async {
                self.delegate.hideLoadingIndicator?()
                if !status {
                    self.delegate.showAlert!(msg: message ?? "")
                }else {
                    self.delegate.reloadData()
                }
            }
        }
    }
    func reset()  {
        model.rest()
        delegate.didReset()
        model.getFeed {(status, message) in
            DispatchQueue.main.async {
                if !status {
                    self.delegate.showAlert!(msg: message ?? "")
                }else {
                    self.delegate.reloadData()
                }
            }
        }
    }
    func getItemByIntex(intex: Int) -> Feed? {
        return model.getItemByIntex(intex: intex)
    }
    
    func getFeedCount() -> Int {
        return model.getFeedCount()
    }
}


