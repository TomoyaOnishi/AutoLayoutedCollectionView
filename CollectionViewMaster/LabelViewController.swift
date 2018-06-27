import UIKit

final class LabelViewController: UIViewController {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset.top = 100
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 500), collectionViewLayout: layout)
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureViews()
    }
    
    deinit {
        print(#function, type(of: self))
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    var token: NSObjectProtocol?
    private func configureViews() {
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: NSStringFromClass(LabelCell.self))
        
        collectionView.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        token = NotificationCenter.default.addObserver(forName: .keyWindowFrameWillChange, object: nil, queue: .main) { [weak self] (_) in
            self?.collectionView.collectionViewLayout.invalidateLayout()
        }
        
    }
    
}

extension LabelViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 30 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 30 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LabelCell.self), for: indexPath)
    }
}
