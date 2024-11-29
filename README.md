# Menu bar component SwiftUI

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fswiftuiux%2Fd3-menu-bar%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/swiftuiux/d3-menu-bar)

## Features
- [x] Observing menu selection changes via generic PreferenceKey
- [x] The color intensity automatically adjusts depending on color scheme (Color+Ext.swift) You don't need to set color for every scheme
- [x] Various strategies for the item menu width allocation
- [x] Set scroll position according the initial selection
- [x] Setting custom colors for the component
- [x] Customize menu item style [round or square]
- [x] iOS and macOS support
- [x] Dark and light scheme support

## Required

### 1. enum
Define enum with menu items conforming to ```IMenuItem```

```Swift 
enum MenuItems: String, IMenuItem {
    case one = "one"
    case two = "two"
    case three = "three"
}
```
### 2. create menu bar

* `selected` - pass value bound to **@State var selected : MenuItems?**
* `values` - Pass allCases as a parameter

```Swift 
MenuBar(values: MenuItems.allCases, selected: $selected)
  .onSelectionChanged{ item in }
```

## Optional

* `strategy` - default strategy for the item menu width allocation is **auto**

| Size strategy | Description |
| --- | --- |
|**fit**| Allocate all affordable space **not scrollable**|
|**auto**| Auto size according the content |
|**flex(CGFloat)**| Set up minimal width|

* `color` - default value is **.black**

* `style` - default style is **round**

| Style | Description |
| --- | --- |
|**round**| rounded corners |
|**square**| squared corners |


### Component init examples

```Swift
    @State var selected : MenuItems?

   VStack{
        MenuBar(values: items, selected: $selected, strategy: .flex(102), color: .green)
        MenuBar(values: items, selected: $selected, color: .purple, style: .square)
        MenuBar(values: items, selected: $selected, strategy: .fit, color: .blue)        
        MenuBar(values: items, selected: $selected, color: .red)
    } 
```
[![click to watch expected UI behavior for the example](https://github.com/swiftuiux/d3-menu-bar/blob/main/Sources/img/img.png)](https://youtu.be/PQRkU7yWUrk)

## Code example

Take a look on the example preview in [**MenuContentView.swift**](https://github.com/swiftuiux/d3-menu-bar/blob/main/Sources/d3-menu-bar/example/MenuViewExample.swift) or create a project, add the package and put **MenuContentView()** in **ContentView()**

## Used in
[Auto scrollable header menu - SwiftUI & Combine](https://github.com/swiftuiux/d3-scrollable-menu-list)

## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**
