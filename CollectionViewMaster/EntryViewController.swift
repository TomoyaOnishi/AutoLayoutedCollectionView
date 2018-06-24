import UIKit

final class EntryViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    deinit {
        print(#function, type(of: self))
    }
    
    @IBAction func didTapButton(_ button: UIButton) {
        switch button {
        case buttons[0]:
            Router.navigate(to: .simple)
        case buttons[1]:
            Router.navigate(to: .uilabel)
        case buttons[2]:
            Router.navigate(to: .twoLabel)
        case buttons[3]:
            Router.navigate(to: .mutableWidthTwoLabel)
        case buttons[4]:
            Router.navigate(to: .complicated)
        default:
            break
        }
    }
    
    
}
