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
        
        let subview = UIView()
        subview.backgroundColor = .red
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(subview)
        subview.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        subview.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        let subviewWidth = subview.widthAnchor.constraint(equalToConstant: 120)
        subviewWidth.priority = .defaultHigh
        subviewWidth.isActive = true
        
        let subviewHeight = subview.heightAnchor.constraint(equalToConstant: 120)
        subviewHeight.priority = .defaultHigh
        subviewHeight.isActive = true
    }
    
}
