import UIKit

final class MutableTwoLabelViewController: UIViewController {
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
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
        super.init(nibName: nil, bundle: nil)
        configureViews()

        token = NotificationCenter.default.addObserver(forName: .keyWindowFrameWillChange, object: nil, queue: .main) { [weak self] (_) in
            self?.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MutableTwoLabelCell.self, forCellWithReuseIdentifier: NSStringFromClass(MutableTwoLabelCell.self))
        
        collectionView.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        print(#function)
        super.viewWillLayoutSubviews()
        
        // スクロールすると途中でたまに呼ばれる原因がわからず...
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        super.willTransition(to: newCollection, with: coordinator)
    }
    
}

extension MutableTwoLabelViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 30 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 30 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(MutableTwoLabelCell.self), for: indexPath) as! MutableTwoLabelCell
        switch indexPath.item % 5 == 0 {
        case true: cell.width = collectionView.bounds.width - layout.sectionInset.left - layout.sectionInset.right
        case false: cell.width = 100
        }
        return cell
    }
    
}

extension MutableTwoLabelViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(#function)
    }
}
