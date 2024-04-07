import SwiftUI

@main
struct EntryApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @ObservedObject private var themeManager = ThemeManager.shared

    var body: some Scene {
        WindowGroup {
//            ContentApp().environmentObject(themeManager)
            SearchResultsUI()
        }
    }
}

struct ContentApp: View {

    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        let _ = Self._printChanges()

        Text("Hello theme")
        .foregroundColor(.label.primary)
        .padding()
        .background(Color.background.primary)

        Button("Just change current theme") {
            themeManager.currentThemeType = .dark
        }


        TabView {
            Text("1")
            .badge(2)
            .tabItem { Label("tab.item.home", systemImage: "house.fill") }

            Text("2")
            .tabItem { Label("tab.item.message", systemImage: "message.fill") }

            Text("3")
            .tabItem { Label("tab.item.favorites", systemImage: "bookmark.fill") }

            Text("4")
            .tabItem { Label("tab.item.profile", systemImage: "person.fill") }
        }
        .accentColor(.label.secondary)
    }
}
