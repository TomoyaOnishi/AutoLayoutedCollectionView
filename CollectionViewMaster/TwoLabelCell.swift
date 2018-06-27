import UIKit

final class TwoLabelCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
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
        
        let label1Width = label1.widthAnchor.constraint(equalToConstant: 150)
        label1Width.priority = UILayoutPriority(999)
        label1Width.isActive = true
        
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

    }
    
}
