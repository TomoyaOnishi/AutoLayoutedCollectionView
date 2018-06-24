import UIKit

final class ComplicatedUIViewController: UIViewController {
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
            self?.collectionView.reloadData()
        }
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ComplicatedUICell.self, forCellWithReuseIdentifier: NSStringFromClass(ComplicatedUICell.self))
        
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

extension ComplicatedUIViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 30 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 30 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ComplicatedUICell.self), for: indexPath) as! ComplicatedUICell
        switch indexPath.item % 5 == 0 {
        case true: cell.width = collectionView.bounds.width - layout.sectionInset.left - layout.sectionInset.right
        case false: cell.width = 200
        }
        
        switch indexPath.item % 4 {
        case 0:
            cell.stackLabel1.isHidden = true
            cell.stackLabel2.isHidden = false
            cell.stackLabel3.isHidden = false
        case 1:
            cell.stackLabel1.isHidden = false
            cell.stackLabel2.isHidden = true
            cell.stackLabel3.isHidden = false
        case 2:
            cell.stackLabel1.isHidden = false
            cell.stackLabel2.isHidden = false
            cell.stackLabel3.isHidden = true
        default:
            cell.stackLabel1.isHidden = false
            cell.stackLabel2.isHidden = false
            cell.stackLabel3.isHidden = false
        }
        
        switch indexPath.item % 2 == 0 {
        case true:
            cell.stack.axis = .vertical
        case false:
            cell.stack.axis = .horizontal
        }
        
        switch indexPath.item % 3 {
        case 0:
            cell.textView.text = "ZZZZZZZZZZZZZZZZZZZZZZZZ"
        case 1:
            cell.textView.text = nil
        default:
            break
        }
        
        return cell
    }
    
}

extension ComplicatedUIViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
}
