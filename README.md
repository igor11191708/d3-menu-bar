# Menu bar component (SwiftUI)

## Features
- [x] Observing menu selection changes via generic PreferenceKey
- [x] The color intensity automatically adjust depending on color scheme (Color+Ext.swift) You don't need to set color for every scheme
- [x] Various strategy for the item menu width allocation
- [x] Restore scroll position according the selection
- [x] Setting custom colors for the component
- [x] Customize menu item style [Round or Square]
- [x] iOS and macOS support
- [x] Dark and light scheme support

## Main

### 1. enum
Define enum with menu items conforms to ```IMenuItem```

```Swift 
enum MenuItems: String, IMenuItem {
    case one = "one"
    case two = "two"
    case three = "three"
}
```
### 2. create menu bar
Pass allCases as a parameter
```Swift 
MenuBar(values: MenuItems.allCases)
  .onSelectionChanged{ item in }
```

Pass a clouser to **onSelectionChanged** if you need react on selection changed.
In this case it does not trigger rerender as if in case you used passing selected item via binding

## Additional 

#### 2.1 selected
Pass one of the case from defined enum

#### 2.2 strategy
Default strategy for the item menu width allocation is **auto**

| Size strategy | Description |
| --- | --- |
|**fit**| Alocate all affodable space **not scrollable**|
|**auto**| Auto size acoording the content |
|**flex(CGFloat)**| Set up minimal width|

#### 2.3 color
Default value is **.black**

#### 2.4 style
Default style is **round**

| Style | Description |
| --- | --- |
|**round**| rounded corners |
|**square**| squared corners |


### Component init examples

```Swift
   VStack{
        MenuBar(values: items, selected: .one, strategy: .flex(102), color: .green)
        MenuBar(values: items, selected: .five, color: .purple, style: .square)
        MenuBar(values: items, selected: .five, strategy: .fit, color: .blue)        
        MenuBar(values: items, selected: .six, color: .red)
        MenuBar(values: items, color: .yellow)
        MenuBar(values: items)
    } 
```
[![click to watch expected UI behavior for the example](https://github.com/The-Igor/d3-menu-bar/blob/main/Sources/img/img.png)](https://youtu.be/PQRkU7yWUrk)

## Example

Take a look on the example preview in **MenuContentView.swift** or create a project and put **MenuContentView()** in **ContentView()**


