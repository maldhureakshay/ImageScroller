# ImageScroller
Easy way to implement autoscroll images 

### Demo

<img src="ImageScroller/images/output.gif" width="250"/>


## Customization

##### Pager Behaviour

The pager indicator can be updated progressive as we swipe or at once in the middle of the transition between the view controllers.
By setting up `pagerBehaviour` property we can choose how the indicator should be updated.

```swift
public var pagerBehaviour: PagerTabStripBehaviour
```

```swift
public enum PagerTabStripBehaviour {
    case Common(skipIntermediteViewControllers: Bool)
    case Progressive(skipIntermediteViewControllers: Bool, elasticIndicatorLimit: Bool)
}
```
