
import UIKit

final class ComplicatedUICell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    let textView = UITextView()
    
    let stack = UIStackView()
    let stackLabel1 = UILabel()
    let stackLabel2 = UILabel()
    let stackLabel3 = UILabel()
    
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
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        let labelWidth = label.widthAnchor.constraint(equalToConstant: 150)
        labelWidth.priority = UILayoutPriority(999)
        labelWidth.isActive = true
        
        textView.backgroundColor = .orange
        textView.text = "十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会十一月同窓会"
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = false
        textView.isEditable = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        textView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        textView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        
        let switch1 = UISwitch()
        switch1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(switch1)
        switch1.isOn = true
        switch1.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        switch1.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 15).isActive = true
        
        let switch2 = UISwitch()
        switch2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(switch2)
        switch2.isOn = true
        switch2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        switch2.centerYAnchor.constraint(equalTo: switch1.centerYAnchor, constant: 10).isActive = true
        
        
        stackLabel1.text = "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        stackLabel1.backgroundColor = .blue
        stackLabel1.numberOfLines = 0
        stackLabel1.text = "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        stackLabel1.font = UIFont.preferredFont(forTextStyle: .headline)
        
        stackLabel2.text = "222222"
        stackLabel2.backgroundColor = .red
        
        stackLabel3.text = "33333333"
        stackLabel3.backgroundColor = .purple
        
        stack.addArrangedSubview(stackLabel1)
        stack.addArrangedSubview(stackLabel2)
        stack.addArrangedSubview(stackLabel3)

        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: switch1.bottomAnchor, constant: 50).isActive = true
        stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        let stackBottom = stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        stackBottom.priority = .defaultLow
        stackBottom.isActive = true
        
    }
    
}
