# ImageScroller
Easy way to implement autoscroll images 

### Demo

<img src="ImageScroller/images/output.gif" width="250"/>


## Usage

##### initial setup

```swift
 imageScroller.delegate = self
        imageScroller.isAutoScrollEnabled = true
        imageScroller.scrollTimeInterval = 2.0 //time interval
        imageScroller.scrollView.bounces = false
        imageScroller.setupScrollerWithImages(images: sampleImages)
```
##### implement pagechanged delegate

```swift
extension ViewController : ImageScrollerDelegate{
    
    func pageChanged(index: Int) {
        self.pageIndicatorLabel.text = String(format: "%d/%d", index+1,self.sampleImages.count)
    }
}
```


## Thats it!
# Happy Coding
