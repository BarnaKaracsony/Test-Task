//
//  MaterialsGridCollectionViewController.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 13.04.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

struct MaterialGridItem {
    let id: String
    let image: UIImage?
    let title: String
    let author: String
    let dateCreated: String
    let dateModified: String
}

protocol MaterialsGridCollectionViewControllerDelegate: AnyObject {
    
    func materialGrid(_ viewController: MaterialsGridCollectionViewController, itemSelected item: MaterialGridItem)
}

class MaterialsGridCollectionViewController: UICollectionViewController {
    
    var items: [MaterialGridItem] = []
    
    weak var delegate: MaterialsGridCollectionViewControllerDelegate?
    
    private var layout: UICollectionViewFlowLayout
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Materials"
        layout.itemSize = CGSize(width: (view.frame.width - (style.horizontalMargins * 2) - layout.minimumInteritemSpacing) / 2, height: 200)
        layout.sectionInset = UIEdgeInsets(top: style.verticalMargins, left: style.horizontalMargins, bottom: style.verticalMargins, right: style.horizontalMargins)
        
        collectionView.register(MaterialCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.backButtonTitle = ""
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // ToDo Implement this delegate method
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // ToDo Implement this delegate method
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // ToDo Implement this delegate method
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.materialGrid(self, itemSelected: item)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MaterialCell {
            UIView.animate(withDuration: 0.3, animations: {
                cell.overlayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            }, completion: nil)
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MaterialCell {
            cell.overlayView.backgroundColor = UIColor.clear
        }
    }
}

class MaterialCell : UICollectionViewCell {
    
    private weak var stackView: UIStackView!
    weak var image: UIImageView!
    weak var title: UILabel!
    weak var author: UILabel!
    weak var overlayView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        setupContentView()
        createStackView()
        createImage()
        createTitle()
        createAuthor()
        createOverlayView()
    }
    
    private func setupContentView() {
        contentView.layer.cornerRadius = 24
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.withAlphaComponent(0.24).cgColor
        contentView.clipsToBounds = true
    }
    
    private func createStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.frame = contentView.bounds.inset(by: UIEdgeInsets.init(top: 0, left: 0, bottom: style.cardPadding, right: 0))
        
        contentView.addSubview(stackView)
        
        self.stackView = stackView
    }
    
    private func createImage() {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        stackView.addArrangedSubview(image)
        self.image = image
    }
    
    private func createTitle() {
        title = createLabel()
        title.numberOfLines = 2
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        stackView.setCustomSpacing(style.cardPadding, after: image)
    }
    
    private func createAuthor() {
        author = createLabel()
        author.numberOfLines = 1
        author.font = UIFont.preferredFont(forTextStyle: .subheadline)
        stackView.setCustomSpacing(style.cardPadding, after: author)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textColor = style.onSurface
        stackView.addArrangedSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: style.cardPadding),
            label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -style.cardPadding)
        ])
        return label
    }
    
    private func createOverlayView() {
        let overlayView = UIView()
        overlayView.frame = contentView.bounds
        overlayView.backgroundColor = UIColor.clear
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.addSubview(overlayView)
        
        self.overlayView = overlayView
    }
}
