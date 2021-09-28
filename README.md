# PrettyBorder

## Description
PrettyBorder is a SwiftUI package for managing an customized border and background at any kind of view.

<br>

## Preview of end result
<table>
  <tr>
    <td>Default implementation</td>
     <td>Customized Parameters</td>
  </tr>
  <tr>
    <td valign="top"><img src="https://i.imgur.com/BLwEYGl.gif" width="220" height="450" ></td>
    <td valign="top"><img src="https://i.imgur.com/OAYsNVn.gif" width="220" height="450"></td>
  </tr>
 </table>
 
 <br>
 
## Parameters
Parameters are:
### This parameter keeps track of view itself is enabled or not
```
- isEnabled : Binding<Bool> 
```

### Those are used for customizing the border
```
- borderCornerRadius: CGFloat
- borderStrokeColor: Color
- borderLineWidth : CGFloat
```

### Color customization for view itself is enabled or not 
```
- disabledColor: Color
- enabledColor: Color
```

### Those are used for giving padding around view itself and border
```
- paddingFromLeft: CGFloat
- paddingFromTop: CGFloat
- paddingFromRight: CGFloat 
- paddingFromBottom: CGFloat 
```


 ## Usage 
 ```Swift
struct ContentView: View {
    
   @State private var isEnabled = false
    
    var body: some View {
        Text("Pretty Border is Awesome!")
            .onTapGesture {
                isEnabled.toggle()
            }
            .modifier(PrettyBorder(isEnabled: $isEnabled,
            borderCornerRadius: nil, borderStrokeColor: nil,
            borderLineWidth: nil, disabledColor: nil, 
            enabledColor: nil, paddingFromLeft: nil,
            paddingFromTop: nil, paddingFromRight: nil, 
            paddingFromBottom: nil))
    }
}
```

or

```Swift
struct ContentView: View {

    @State private var isEnabled = false

    var body: some View {
        Text("Pretty Border is Awesome!")
            .onTapGesture {
            isEnabled.toggle()
        }
            .modifier(PrettyBorder(isEnabled: $isEnabled,
            borderCornerRadius: 50, 
            borderStrokeColor: .gray, borderLineWidth: 4,
            disabledColor: .red, enabledColor: .green, 
            paddingFromLeft: 5, 
            paddingFromTop: 30, paddingFromRight: 50, 
            paddingFromBottom: 10))
    }
}
```

