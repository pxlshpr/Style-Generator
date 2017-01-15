import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        initiateBackend()
        
        let primaryColorViewController = ColorViewController(colors: MaterialColorStruct.primaryColors)
//        let colors = [MaterialColorStruct.brown, MaterialColorStruct.amber]
//        let secondaryColorViewController = ColorViewController(colors: colors)
        
        let navigationViewController = UINavigationController(rootViewController: primaryColorViewController)
        
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

