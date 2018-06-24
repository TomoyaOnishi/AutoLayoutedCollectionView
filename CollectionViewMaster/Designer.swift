import UIKit

extension Notification.Name {
    static let keyWindowFrameWillChange = Notification.Name("keyWindowFrameChange")
}

final class Designer {
    @objc class func resize() {
        NotificationCenter.default.post(name: .keyWindowFrameWillChange, object: nil)
        if UIApplication.shared.keyWindow?.frame.size.width == 320 {
            UIApplication.shared.keyWindow?.frame.size.width = UIScreen.main.bounds.width
        } else {
            UIApplication.shared.keyWindow?.frame.size.width = 320
        }
    }
}
