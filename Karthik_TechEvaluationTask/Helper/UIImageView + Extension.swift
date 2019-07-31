//
//  UIImageView + Extension.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView{
    
    public func kf_animateAnimateCacheImage(duration: TimeInterval
        , cacheImage : UIImage?,cache : CacheType){
        if  cacheImage != nil && cache == .disk   {
            UIView.transition(with: self, duration: duration,
                              options:.transitionCrossDissolve,
                              animations: {
                                self.image = cacheImage
            },
                              completion: { finished in
                                
            })
        }
    }
    
    func setImageAndAnimateWithPlaceholter(imageurl : URL? ,placeholder : String)  {
        if imageurl != nil {
            self.setImageAndAnimate(url : imageurl! ,placeholder : placeholder)
        }else{
            self.image = UIImage(named: placeholder)
        }
    }
    func setImageAndAnimate(url : URL ,placeholder : String)  {
        let duration: TimeInterval = 1
        let optionInfo: KingfisherOptionsInfo = [
            .transition(ImageTransition.none)
        ]
        self.kf.setImage(with:url, placeholder: UIImage(named : placeholder), options: optionInfo, progressBlock: { (receivedSize :Int64, totalSize :Int64) in
            
        }) { (image:Image?, error : NSError?, cacheType : CacheType, imageURL :URL?) in
            self.kf_animateAnimateCacheImage(duration: duration, cacheImage: image, cache: cacheType)
        }
    }
    func setImageAndAnimate(url : URL)  {
        let duration: TimeInterval = 1
        let optionInfo: KingfisherOptionsInfo = [
            .transition(ImageTransition.fade(duration))
        ]
        self.kf.setImage(with:url, placeholder: nil, options: optionInfo, progressBlock: { (receivedSize :Int64, totalSize :Int64) in
            
        }) { (image:Image?, error : NSError?, cacheType : CacheType, imageURL :URL?) in
            self.kf_animateAnimateCacheImage(duration: duration, cacheImage: image, cache: cacheType)
        }
    }
    
    func setImageWith(url: URL?){
        self.kf.setImage(with: url)
    }
}
