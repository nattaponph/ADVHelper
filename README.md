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

### * ADVHelper

#### Using ADVHelper programmatically

Import ADVHelper at the top of each Swift file that will be used.

```swift
import ADVHelper
```

### * Localize

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

### * String Extension

#### Using String Extension programmatically

* DateFormatter



**Button**<br>

To show a loader inside the button, and enable or disable user interection while loading

```swift
buttonBtn.showLoader()
```

To hide a loader

```swift
buttonBtn.hideLoader()
```

#### Using ADVHelper in Storyboard

ADVHelper now provides user interface support for View, ImageView, Label, Button, TextField and TextView.

1. Drag a UI into Storyboard.
2. Set class to "View", "ImageView", "Label", "Button", "TextField", and "TextView".
3. Set up attributes inspection.

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
