import UIKit

final class TwoLabelViewController: UIViewController {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset.top = 100
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureViews()
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.register(TwoLabelCell.self, forCellWithReuseIdentifier: NSStringFromClass(TwoLabelCell.self))
        
        collectionView.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension TwoLabelViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 30 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 30 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TwoLabelCell.self), for: indexPath)
    }
}

