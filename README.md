# ImageScroller
Easy way to implement autoscroll images 

### Demo

<img src="ImageScroller/images/output.gif" width="250"/>



## Usage

##### initial setup

```swift
 var sampleImages = ["1.jpg","2.jpg","3.jpg","4.jpg"]
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

##### handling dynamic images
Load your image array, with array of urls of type string and set isDynamicLoad to true 
```swift
    imageScroller.isDynamicLoad = true
```

#### Dependancy 
SDWebImage

## Thats it!
# Happy Coding
