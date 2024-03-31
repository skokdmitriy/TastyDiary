import SwiftUI

@main
struct EntryApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentApp()
        }
    }
}

struct ContentApp: View {

    var body: some View {
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
    }
}
