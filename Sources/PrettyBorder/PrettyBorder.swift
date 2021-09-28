import SwiftUI

@available(macOS 10.15, *)
public struct PrettyBorder: ViewModifier {

    // CHECK IF ITS ENABLED OR DISABLED
    var isEnabled : Binding<Bool>

    // Border modifiers are here
    var borderCornerRadius: CGFloat = 20
    var borderStrokeColor: Color = .black
    var borderLineWidth : CGFloat = 3

    // Background color for view is here
    var disabledColor: Color = .gray
    var enabledColor: Color = .blue
    @State private var currentColor : Color

    // Paddings are Here
    var paddingFromLeft: CGFloat = 10
    var paddingFromTop: CGFloat = 10
    var paddingFromRight: CGFloat = 10
    var paddingFromBottom: CGFloat = 10


    public init(isEnabled : Binding<Bool>) {
        self.isEnabled = isEnabled
        self.currentColor = disabledColor
    }

    @available(iOS 13.0, *)
    @available(macOS 10.15.0, *)
    public func body(content: Content) -> some View {
        if #available(macOS 11.0, *) {
            if #available(iOS 14.0, *) {
                    content
                    // PADDINGS ARE HERE
                        .padding(.leading, paddingFromLeft)
                        .padding(.top, paddingFromTop)
                        .padding(.trailing, paddingFromRight)
                        .padding(.bottom, paddingFromBottom)
                    // BORDER IS HERE
                        .overlay(RoundedRectangle(cornerRadius: self.borderCornerRadius).stroke(borderStrokeColor,lineWidth: borderLineWidth))
                    
                    // BACKGROUND COLOR IS HERE
                        .background(RoundedRectangle(cornerRadius: borderCornerRadius).fill(currentColor))
                    
                    // ANIMATE THE COLOR CHANGE FROM HERE
                        .onChange(of: isEnabled.wrappedValue) { newValue in
                            withAnimation {
                                currentColor = newValue ? enabledColor : disabledColor
                            }
                        }
                
            } else {
                fatalError("Current iOS target version doesn't support onChange method.")
                // Fallback on earlier versions
            }
        } 

    }

}
