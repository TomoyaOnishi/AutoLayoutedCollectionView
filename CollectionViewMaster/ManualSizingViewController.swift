import UIKit

final class ManualSizingViewController: UIViewController {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset.left = 10
        layout.sectionInset.right = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    var layout: UICollectionViewFlowLayout { return collectionView.collectionViewLayout as! UICollectionViewFlowLayout }
    
    var token: NSObjectProtocol?
    
    init() {
        print(#function, type(of: self))
        super.init(nibName: nil, bundle: nil)
        configureViews()
    }
    
    deinit {
        print(#function, type(of: self))
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    private func configureViews() {
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.register(ManualSizingCell.self, forCellWithReuseIdentifier: NSStringFromClass(ManualSizingCell.self))
        
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
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        super.willTransition(to: newCollection, with: coordinator)
    }
    
}

extension ManualSizingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 30 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 30 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ManualSizingCell.self), for: indexPath) as! ManualSizingCell
        return cell
    }
    
}
