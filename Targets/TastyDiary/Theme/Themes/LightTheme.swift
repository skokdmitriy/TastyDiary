import SwiftUI

struct LightTheme: Theme {
    let colors: Colors = LightColors()
}

struct LightColors: Colors {
    let background: BackgroundColors = LightBackgroundColors()
    let label: LabelColors = LightLabelColors()
}

struct LightBackgroundColors: BackgroundColors {
    let primary: Color = .red
    let secondary: Color = .red.opacity(0.5)
    let ghost: Color = .gray.opacity(0.7)
}

struct LightLabelColors: LabelColors {
    let primary: Color = .green
    let secondary: Color = .green.opacity(0.5)
    let tertiary: Color = .gray.opacity(0.8)
}
