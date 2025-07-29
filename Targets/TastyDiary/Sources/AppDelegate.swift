import UIKit
import TastyDiaryKit
import TastyDiaryUI

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        TastyDiaryKit.hello()
        TastyDiaryUI.hello()

		CustomFontManager.registrationCustomFonts()

        ThemeManager.shared.themes = [
            .light: ThemeStorage.light,
            .dark: ThemeStorage.dark
        ]

        return true
    }
}
