import UIKit

final class SimpleCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    private func configureViews() {
        layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
        
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true

    }
    
}
