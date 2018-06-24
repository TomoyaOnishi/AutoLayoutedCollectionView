import UIKit

final class MutableTwoLabelCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    struct AutoLayout {
        var width: NSLayoutConstraint?
    }
    var autolayout: AutoLayout = AutoLayout()
    
    var width: CGFloat {
        get {
            return autolayout.width?.constant ?? 0.0
        }
        set {
            autolayout.width?.constant = newValue
        }
    }
    
    private func configureViews() {
        layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
        
        contentView.backgroundColor = .green
        
        let label1 = UILabel()
        label1.backgroundColor = .orange
        label1.numberOfLines = 0
        label1.text = "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        label1.font = UIFont.preferredFont(forTextStyle: .headline)
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label1)
        
        label1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        // label2が下に来るのでlabel1側からはbottomは決めない
        // label1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        let label2 = UILabel()
        label2.backgroundColor = .orange
        label2.numberOfLines = 0
        label2.text = "十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会"
        label2.font = UIFont.preferredFont(forTextStyle: .headline)
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label2)

        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5).isActive = true
        label2.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        // Layout engineはlabel1,label2がどれだけ縦に伸びて、どれだけ横に伸びればいいのかわからないので横か縦は決めてあげる
        // 横は外から決められるようにプロパティに保持する
        contentView.translatesAutoresizingMaskIntoConstraints = false
        autolayout.width = contentView.widthAnchor.constraint(equalToConstant: 100)
        autolayout.width?.isActive = true
    }
    
}
