//
//  ImageScroller.swift
//  ImageScroller
//
//  Created by Akshaykumar Maldhure on 8/29/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit

protocol ImageScrollerDelegate {
    func pageChanged(index : Int)
}

class ImageScroller: UIView {
    
    var scrollView : UIScrollView = UIScrollView()
    var delegate : ImageScrollerDelegate? = nil
    var isAutoScrollEnabled = false
    var scrollTimeInterval = 5.0
    
    func setupScrollerWithImages(images : [String]) {
        scrollView.frame = self.frame
        scrollView.delegate = self
        var x : CGFloat = 0.0
        let y : CGFloat = 0.0
        var index : CGFloat = 0
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        self.scrollView.contentSize = CGSize(width: CGFloat(images.count) * self.frame.size.width, height: self.frame.height)
        for image in images{
            let imageView = UIImageView(frame: CGRect(x: x, y: y, width: self.frame.width, height: self.frame.height))
            imageView.image = UIImage(named:image)
            self.scrollView.addSubview(imageView)
            index = index + 1
            x = self.scrollView.frame.width * index
        }
        self.addSubview(scrollView)
        
        if isAutoScrollEnabled{
            Timer.scheduledTimer(timeInterval: scrollTimeInterval, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
        }
       
    }
    
    func autoscroll() {
        if isAutoScrollEnabled{
        let contentWidth = self.scrollView.contentSize.width
        let x = self.scrollView.contentOffset.x + self.scrollView.frame.size.width
        if x < contentWidth{
            self.scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        }else{
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        }
    }

}

extension ImageScroller : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNum = (Int)(self.scrollView.contentOffset.x / self.scrollView
            .frame.size.width)
        if let delegate = self.delegate{
            delegate.pageChanged(index: pageNum)
        }
    }
}
