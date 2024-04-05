import SwiftUI

struct DarkTheme: Theme {
    let colors: Colors = DarkColors()
}

struct DarkColors: Colors {
    let background: BackgroundColors = DarkBackgroundColors()
    let label: LabelColors = DarkLabelColors()
}

struct DarkBackgroundColors: BackgroundColors {
    let primary: Color = .yellow
    let secondary: Color = .yellow.opacity(0.5)
}

struct DarkLabelColors: LabelColors {
    let primary: Color = .blue
    let secondary: Color = .blue.opacity(0.5)
}
