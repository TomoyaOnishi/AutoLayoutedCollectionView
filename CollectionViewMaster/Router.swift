import Foundation
import UIKit

final class Router {
    
    enum Destination {
        case main
        case simple
        case uilabel
        case twoLabel
        case mutableWidthTwoLabel
        case complicated
    }
    
    class func navigate(to destination: Destination) {
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = wrapNavigationController(root: viewController(for: destination))
    }
    
    private class func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .main: return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!
        case .simple: return SimpleViewController()
        case .uilabel: return LabelViewController()
        case .twoLabel: return TwoLabelViewController()
        case .mutableWidthTwoLabel: return MutableTwoLabelViewController()
        case .complicated: return ComplicatedUIViewController()
        }
    }
    
    private class func wrapNavigationController(root: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: root)
        root.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(navigatieToMain))
        root.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "resize", style: .plain, target: Designer.self, action: #selector(Designer.resize))
        return navigation
    }
    
    @objc class func navigatieToMain() {
        navigate(to: .main)
    }
    
}
