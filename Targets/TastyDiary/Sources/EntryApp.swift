import SwiftUI

@main
struct EntryApp: App {
	@UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
	@ObservedObject private var themeManager = ThemeManager.shared

	var body: some Scene {
		WindowGroup {
			ContentApp().environmentObject(themeManager)
		}
	}
}

struct ContentApp: View {
	var body: some View {
		TabView {
			SearchResultsUI()
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
