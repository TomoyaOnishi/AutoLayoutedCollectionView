import UIKit

final class LabelCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    private func configureViews() {
        layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
        
        contentView.backgroundColor = .green

        let label = UILabel()
        label.backgroundColor = .orange
        label.numberOfLines = 0
        label.text = "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        // Layout engineはラベルがどれだけ縦に伸びて、どれだけ横に伸びればいいのかわからないので横幅は決めてあげる
        // すると縦の高さはLayout engineが計算できるようになる(ここではUILabelのintrinsicContentSize.height)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
}
