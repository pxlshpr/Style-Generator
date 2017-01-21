import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        prepopulateRealm()
        deleteAllRealmData()
        ColorObject.addMaterialColors()
        //TODO: have a notification for when the Realm data actually does get added so that we can reload at that point 
        
        let primaryColorViewController = ColorViewController(colors: MaterialColorStruct.primaryColors)
//        let colors = [MaterialColorStruct.brown, MaterialColorStruct.amber]
//        let secondaryColorViewController = ColorViewController(colors: colors)
        
        let navigationViewController = UINavigationController(rootViewController: primaryColorViewController)
        
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    //TODO: Move this to Toolbelt
    private func prepopulateRealm() {
//        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!
//        let bundleRealmPath = Bundle.main.url(forResource: "prepopulated-data", withExtension: "realm")
//        
//        if !FileManager.default.fileExists(atPath: defaultRealmPath.absoluteString) {
//            do {
//                try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
//            } catch let error {
//                print("error copying prepopulated data: \(error)")
//            }
//        }
    }
}

