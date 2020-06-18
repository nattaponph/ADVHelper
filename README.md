# ADVHelper

[![Version](https://img.shields.io/cocoapods/v/ADVHelper.svg?style=flat)](https://cocoapods.org/pods/ADVHelper)
[![License](https://img.shields.io/cocoapods/l/ADVHelper.svg?style=flat)](https://cocoapods.org/pods/ADVHelper)
[![Platform](https://img.shields.io/cocoapods/p/ADVHelper.svg?style=flat)](https://cocoapods.org/pods/ADVHelper)
[![Language](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://cocoapods.org/pods/ADVHelper)

## Requirements

iOS 12.0 or above

## Installation

ADVHelper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ADVHelper'
```

## Usage

### - ADVHelper

#### Using ADVHelper programmatically

Import ADVHelper at the top of each Swift file that will be used.

```swift
import ADVHelper
```

### - Localize

#### Using Localize programmatically

Add `.localized()` following any `String` object you want translated:
```swift
let _ = "String".localized()
```

To change the current language:
```swift
Localize.setCurrentLanguage("th")
```

To update the UI in the view controller where a language change can take place, observe LCLLanguageChangeNotification:
```swift
NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
```

Example function `setText()`

```swift
@objc func setText() {
    titleLabel.localizeKey = "String".localized()
    textFieldBox.localizeKey = "String".localized()
    textViewBox.localizeKey = "String".localized()
    buttonBtn.localizeKey = "String".localized()
}
```

### - String Extension

#### Using String Extension programmatically

###### - DateFormatter

- Function `dateFormat` for set output `format`
  
In this function, it supports the input formats `yyyy-MM-dd HH: mm: ss` and `yyyy-MM-dd`. And default local date for input `en`. And local date for output are based on `Localize Language`.
  
Example input date
```swift
let inputDateStr = "2020-06-17 10:20:30"
```
  
Example of use
```swift
titleLabel.text = inputDateStr.dateFormat(format: "dd/MM/yyyy HH:mm")
```
  
Output
```
17/06/2020 10:20
```
  
- Function `dateFormat` for set `fromFormat` and `toFormat`
  
In this function, it default local date for input `en`. And local date for output are based on `Localize Language`.
  
Example input date
```swift
let inputDateStr = "2020-06-17 10:20:30"
```
  
Example of use
```swift
titleLabel.text = inputDateStr.dateFormat(fromFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "dd/MM/yyyy HH:mm")
```
  
Output
```
17/06/2020 10:20
```

- Function `dateFormat` for set `fromFormat` `toFormat` and `toLocaleIdentifier`
  
In this function, it default local date for input `en`.
  
Example input date
```swift
let inputDateStr = "2020-06-17 10:20:30"
```
  
Example of use
```swift
titleLabel.text = inputDateStr.dateFormat(fromFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "dd/MM/yyyy HH:mm", toLocaleIdentifier: "th")
```
  
Output
```
17/06/2563 10:20
```

- Function `dateFormat` for all set `fromFormat` `fromLocaleIdentifier` `toFormat` and `toLocaleIdentifier`
  
Example input date
```swift
let inputDateStr = "2563-06-17 10:20:30"
```
  
Example of use
```swift
titleLabel.text = inputDateStr.dateFormat(fromFormat: "yyyy-MM-dd HH:mm:ss", fromLocaleIdentifier: "th", toFormat: "dd/MM/yyyy HH:mm", toLocaleIdentifier: "en")
```
  
Output
```
17/06/2020 10:20
```

### - Button

#### Using Button programmatically

###### - Loading

![Loading_Btn](Screenshot/Loading_Btn.gif)

To show a loader inside the button, and enable or disable user interection while loading

```swift
buttonBtn.showLoader()
```

To hide a loader

```swift
buttonBtn.hideLoader()
```

#### Using Button in Storyboard

The steps for use
1. Drag a UIButton into Storyboard.
2. Set class to `Button`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_Btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_btn.png" alt="" width="200"/> <img src="Screenshot/CornerRadiusFull_btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

###### - Shadow

<img src="Screenshot/Shadow_Btn.png" alt="" width="200"/> <img src="Screenshot/Shadow2_Btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
shadowColor | UIColor  | The color of the layer’s shadow. | UIColor.clear 
shadowOpacity | Float  | The opacity of the layer’s shadow. | 0 
shadowOffset | CGSize  | The offset (in points) of the layer’s shadow. | CGSize.zero 
shadowRadius | CGFloat  | The blur radius (in points) used to render the layer’s shadow. | 0 

###### - Gradient Background

<img src="Screenshot/GradientBackground_Btn.png" alt="" width="200"/> <img src="Screenshot/GradientBackground2_Btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
gradientEnabled | Bool  | Enable gradient background.  | false 
gradientStartColor | UIColor  | Start color gradient background.  | UIColor.clear 
gradientEndColor | UIColor  | End color gradient background.  | UIColor.clear 
gradientHorizontal | Bool  | Is the horizontal gradient background.  | false 

###### - Click Animate

<img src="Screenshot/ClickAnimate_Btn.gif" alt="" width="200"/> <img src="Screenshot/ClickAnimate2_Btn.gif" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
animatedScaleWhenHighlighted | CGFloat  | Animation scale when highlighted.  | 1.0 
animatedScaleDurationWhenHighlighted | Double  | Animation scale duration when highlighted.  | 0.2 

###### - Ripple

<img src="Screenshot/Ripple1_Btn.gif" alt="" width="200"/> <img src="Screenshot/Ripple2_Btn.gif" alt="" width="200"/> <img src="Screenshot/Ripple3_Btn.gif" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
ripple | Bool  | Enable ripple animation.  | false 
rippleColor | UIColor  | The color of the ripple animation.  | UIColor(white: 1.0, alpha: 0.3) 
rippleSpeed | Double  | The speed of the ripple animation.  | 1.0 

###### - Image

<img src="Screenshot/Image25_Btn.png" alt="" width="200"/> <img src="Screenshot/Image50_Btn.png" alt="" width="200"/> <img src="Screenshot/Image75_Btn.png" alt="" width="200"/> <img src="Screenshot/Image100_Btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
imageViewContentMode | Int  | Options to specify how a view adjusts its content when its size changes. * [ContentMode](https://developer.apple.com/documentation/uikit/uiview/contentmode) | 0 
imageAlpha | CGFloat  | The image view's alpha value. | 1.0 

###### - Underline

<img src="Screenshot/Underline_Btn.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
isUnderline | Bool  | Enable underline.  | false 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

nattaponph, nattaponph58@nu.ac.th

## License

ADVHelper is available under the MIT license. See the LICENSE file for more info.

## Credits

* [Kenneth Tsang](https://cocoapods.org/pods/GrowingTextView)
* [Roy Marmelstein](https://cocoapods.org/pods/Localize-Swift)
* [Taha Sönmez](https://medium.com/@mtssonmez/handle-empty-tableview-in-swift-4-ios-11-23635d108409)
