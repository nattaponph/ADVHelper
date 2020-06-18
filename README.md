# ADVHelper

[![Version](https://img.shields.io/cocoapods/v/ADVHelper.svg?style=flat)](http://cocoapods.org/pods/ADVHelper)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift)

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

Connect the UI to Code
```swift
@IBOutlet weak var buttonBtn: Button!
```

###### - Localize

Define text with `localizeKey`
```swift
buttonBtn.localizeKey = "Button".localized()
```

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

### - Label

#### Using Label programmatically

Connect the UI to Code
```swift
@IBOutlet weak var titleLabel: Label!
```

###### - Localize

Define text with `localizeKey`
```swift
titleLabel.localizeKey = "Label".localized()
```

#### Using Label in Storyboard

The steps for use
1. Drag a UILabel into Storyboard.
2. Set class to `Label`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_Label.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_Label.png" alt="" width="200"/> <img src="Screenshot/CornerRadiusFull_Label.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

###### - Shadow

<img src="Screenshot/Shadow_Label.png" alt="" width="200"/> <img src="Screenshot/Shadow2_Label.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
shadowColor | UIColor  | The color of the layer’s shadow. | UIColor.clear 
shadowOpacity | Float  | The opacity of the layer’s shadow. | 0 
shadowOffset | CGSize  | The offset (in points) of the layer’s shadow. | CGSize.zero 
shadowRadius | CGFloat  | The blur radius (in points) used to render the layer’s shadow. | 0 

###### - Underline

<img src="Screenshot/Underline_Label.png" alt="" width="200"/> <img src="Screenshot/Underline2_Label.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
isUnderline | Bool  | Enable underline.  | false 

### - TextField

#### Using TextField programmatically

Connect the UI to Code
```swift
@IBOutlet weak var textFieldBox: TextField!
```

###### - Localize

Define placeholder with `localizeKey`
```swift
textFieldBox.localizeKey = "Placeholder".localized()
```

#### Using TextField in Storyboard

The steps for use
1. Drag a UITextField into Storyboard.
2. Set class to `TextField`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_TextField.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_TextField.png" alt="" width="200"/> <img src="Screenshot/CornerRadiusFull_TextField.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

###### - Shadow

<img src="Screenshot/Shadow_TextField.png" alt="" width="200"/> <img src="Screenshot/Shadow2_TextField.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
shadowColor | UIColor  | The color of the layer’s shadow. | UIColor.clear 
shadowOpacity | Float  | The opacity of the layer’s shadow. | 0 
shadowOffset | CGSize  | The offset (in points) of the layer’s shadow. | CGSize.zero 
shadowRadius | CGFloat  | The blur radius (in points) used to render the layer’s shadow. | 0 

###### - Gradient Background

<img src="Screenshot/GradientBackground_TextField.png" alt="" width="200"/> <img src="Screenshot/GradientBackground2_TextField.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
gradientEnabled | Bool  | Enable gradient background.  | false 
gradientStartColor | UIColor  | Start color gradient background.  | UIColor.clear 
gradientEndColor | UIColor  | End color gradient background.  | UIColor.clear 
gradientHorizontal | Bool  | Is the horizontal gradient background.  | false 

###### - Padding

None | Left | Right | Left & Right
------------ | ------------- | ------------- | ------------- 
<img src="Screenshot/PaddingNo_TextField.png" alt="" width="200"/> | <img src="Screenshot/PaddingL_TextField.png" alt="" width="200"/> | <img src="Screenshot/PaddingR_TextField.png" alt="" width="200"/> | <img src="Screenshot/PaddingLR_TextField.png" alt="" width="200"/> 

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
paddingLeftCustom | CGFloat  | Pads the view along left edges by the specified amount. | 0 
paddingRightCustom | CGFloat  | Pads the view along right edges by the specified amount. | 0 

### - TextView

#### Using TextView programmatically

Connect the UI to Code
```swift
@IBOutlet weak var textViewBox: TextView!
```

###### - Localize

Define placeholder with `localizeKey`
```swift
textViewBox.localizeKey = "Placeholder".localized()
```

#### Using TextView in Storyboard

The steps for use
1. Drag a UITextView into Storyboard.
2. Set class to `TextView`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_TextView.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_TextView.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

###### - Maximum length

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
maxLength | Int | The maximum character length. (0 means no limit) | 0 

###### - Trim

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
trimWhiteSpaceWhenEndEditing | Bool | Trim whitespace and newline characters when end editing. | true 

###### - Height

<img src="Screenshot/Height_TextView.gif" alt="" width="250"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
minHeight | CGFloat | The minimum height limit. (0 means no limit) | 0 
maxHeight | CGFloat | The maximum height limit. (0 means no limit) | 0 

###### - Padding

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
paddingLeftCustom | CGFloat  | Pads the view along left edges by the specified amount. | 8 
paddingRightCustom | CGFloat  | Pads the view along right edges by the specified amount. | 8 
paddingTopCustom | CGFloat  | Pads the view along top edges by the specified amount. | 8 
paddingBottomCustom | CGFloat  | Pads the view along bottom edges by the specified amount. | 8 

### - ImageView

#### Using ImageView programmatically

Connect the UI to Code
```swift
@IBOutlet weak var imageView: ImageView!
```

#### Using ImageView in Storyboard

The steps for use
1. Drag a UIImageView into Storyboard.
2. Set class to `ImageView`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_ImagetView.png" alt="" width="250"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_ImagetView.png" alt="" width="250"/> <img src="Screenshot/CornerRadiusFull_ImagetView.png" alt="" width="250"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

### - View

#### Using View programmatically

Connect the UI to Code
```swift
@IBOutlet weak var view: View!
```

#### Using View in Storyboard

The steps for use
1. Drag a UIView into Storyboard.
2. Set class to `View`
3. Set up attributes inspection.

###### - Border

<img src="Screenshot/Border_View.png" alt="" width="250"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

###### - Corner Radius

<img src="Screenshot/CornerRadius_View.png" alt="" width="250"/> <img src="Screenshot/CornerRadiusFull_View.png" alt="" width="250"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
cornerRadius | CGFloat  | The radius to use when drawing rounded corners for the layer’s background.  | 0 

###### - Shadow

<img src="Screenshot/Shadow_View.png" alt="" width="200"/> <img src="Screenshot/Shadow2_View.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
shadowColor | UIColor  | The color of the layer’s shadow. | UIColor.clear 
shadowOpacity | Float  | The opacity of the layer’s shadow. | 0 
shadowOffset | CGSize  | The offset (in points) of the layer’s shadow. | CGSize.zero 
shadowRadius | CGFloat  | The blur radius (in points) used to render the layer’s shadow. | 0 

###### - Gradient Background

<img src="Screenshot/GradientBackground_View.png" alt="" width="200"/> <img src="Screenshot/GradientBackground2_View.png" alt="" width="200"/>

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
gradientEnabled | Bool  | Enable gradient background.  | false 
gradientStartColor | UIColor  | Start color gradient background.  | UIColor.clear 
gradientEndColor | UIColor  | End color gradient background.  | UIColor.clear 
gradientHorizontal | Bool  | Is the horizontal gradient background.  | false 

### - TableView

#### Using TableView programmatically

Connect the UI to Code
```swift
@IBOutlet weak var dataTableView: TableView!
```

###### - Image Size

Custom Size Image
```swift
dataTableView.imageSizePercentage = .percentage75
```

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
imageSizePercentage | [Percentage](Source/Enum/Percentage.swift) | The image size, in percentage of the TableView size. | percentage75 

###### - Color & Font

Custom Color & Font
```swift
dataTableView.titleColor = UIColor.black
dataTableView.titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
dataTableView.messageColor = UIColor.lightGray
dataTableView.messageFont = UIFont(name: "HelveticaNeue-Regular", size: 17)
```

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
titleColor | UIColor | The color of title. | UIColor.black 
titleFont | UIFont | The font of title. | UIFont(name: "HelveticaNeue-Bold", size: 18) 
messageColor | UIColor | The color of message. | UIColor.lightGray 
messageFont | UIFont | The font of message. | UIFont(name: "HelveticaNeue-Regular", size: 17) 

###### - Empty View

Example of use in `numberOfRowsInSection`
```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if names.count == 0 {
        dataTableView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
    } else {
        dataTableView.restore()
    }
    
    return names.count
}
```

- Function `setEmptyView` for show image only.

Example of use
```swift
dataTableView.setEmptyView(messageImage: #imageLiteral(resourceName: "no_data_icon"), animated: true)
```
  
Output

<img src="Screenshot/Data_Not_Found_Img_TableView.gif" alt="" width="318"/>

- Function `setEmptyView` for show title only.

Example of use
```swift
dataTableView.setEmptyView(title: "Data not found.")
```
  
Output

<img src="Screenshot/Data_Not_Found_Title_TableView.png" alt="" width="318"/>

- Function `setEmptyView` for show title and message.

Example of use
```swift
dataTableView.setEmptyView(title: "Oops!", message: "Data not found.")
```
  
Output

<img src="Screenshot/Data_Not_Found_Title_Message_TableView.png" alt="" width="318"/>

- Function `setEmptyView` for show image and title and message.

Example of use
```swift
dataTableView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
```
  
Output

<img src="Screenshot/Data_Not_Found_Img_Title_Message_TableView.gif" alt="" width="318"/>

###### - Restore

The restore TableView

Example of use
```swift
dataTableView.restore()
```

#### Using TableView in Storyboard

The steps for use
1. Drag a UITableView into Storyboard.
2. Set class to `TableView`
3. Set up attributes inspection.

###### - Border

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border.  | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border.  | 0 

### - CollectionView

#### Using CollectionView programmatically

Connect the UI to Code
```swift
@IBOutlet weak var dataCollectionView: CollectionView!
```

###### - Image Size

Custom Size Image
```swift
dataCollectionView.imageSizePercentage = .percentage75
```

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
imageSizePercentage | [Percentage](Source/Enum/Percentage.swift) | The image size, in percentage of the CollectionView size. | percentage75 

###### - Color & Font

Custom Color & Font
```swift
dataCollectionView.titleColor = UIColor.black
dataCollectionView.titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
dataCollectionView.messageColor = UIColor.lightGray
dataCollectionView.messageFont = UIFont(name: "HelveticaNeue-Regular", size: 17)
```

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
titleColor | UIColor | The color of title. | UIColor.black 
titleFont | UIFont | The font of title. | UIFont(name: "HelveticaNeue-Bold", size: 18) 
messageColor | UIColor | The color of message. | UIColor.lightGray 
messageFont | UIFont | The font of message. | UIFont(name: "HelveticaNeue-Regular", size: 17) 

###### - Empty View

Example of use in `numberOfItemsInSection`
```swift
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if names.count == 0 {
        dataCollectionView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
    } else {
        dataCollectionView.restore()
    }
    
    return names.count
}
```

- Function `setEmptyView` for show image only.

Example of use
```swift
dataCollectionView.setEmptyView(messageImage: #imageLiteral(resourceName: "no_data_icon"), animated: true)
```
  
Output

<img src="Screenshot/Data_Not_Found_Img_TableView.gif" alt="" width="318"/>

- Function `setEmptyView` for show title only.

Example of use
```swift
dataCollectionView.setEmptyView(title: "Data not found.")
```
  
Output

<img src="Screenshot/Data_Not_Found_Title_TableView.png" alt="" width="318"/>

- Function `setEmptyView` for show title and message.

Example of use
```swift
dataCollectionView.setEmptyView(title: "Oops!", message: "Data not found.")
```
  
Output

<img src="Screenshot/Data_Not_Found_Title_Message_TableView.png" alt="" width="318"/>

- Function `setEmptyView` for show image and title and message.

Example of use
```swift
dataCollectionView.setEmptyView(title: "Oops!", message: "Data not found.", messageImage: #imageLiteral(resourceName: "data_not_found_icon"), animated: true)
```
  
Output

<img src="Screenshot/Data_Not_Found_Img_Title_Message_TableView.gif" alt="" width="318"/>

###### - Restore

The restore CollectionView

Example of use
```swift
dataCollectionView.restore()
```

#### Using CollectionView in Storyboard

The steps for use
1. Drag a UICollectionView into Storyboard.
2. Set class to `CollectionView`
3. Set up attributes inspection.

###### - Border

Parameter | Type | Description | Default 
------------ | ------------- | ------------- | ------------- 
borderColor | UIColor  | The color of the layer’s border. | UIColor.clear 
borderWidth | CGFloat  | The width of the layer’s border. | 0 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

nattaponph, nattapon.phothima@gmail.com

## License

ADVHelper is available under the MIT license. See the LICENSE file for more info.

## Credits

* [Kenneth Tsang](https://cocoapods.org/pods/GrowingTextView)
* [Roy Marmelstein](https://cocoapods.org/pods/Localize-Swift)
* [Taha Sönmez](https://medium.com/@mtssonmez/handle-empty-tableview-in-swift-4-ios-11-23635d108409)
