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
