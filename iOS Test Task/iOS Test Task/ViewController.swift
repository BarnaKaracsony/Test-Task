//
//  ViewController.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 12.04.2022.
//

import UIKit

class ViewController: UINavigationController {
    
    private let search = SearchBackend()
    private let utilities = ApiUtilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(LoadingViewController(), sender: self)
        startLoading()
    }
    
    private func startLoading() {
        // ToDo Implement loading and handling of result
        // Please use the following request
        // let request = SearchRequest(filter: "author:geogebrateam")

    }
    
    private func createGridItems(_ items: [SearchItem]) async ->  [MaterialGridItem] {
        // ToDo implement this helper method that converts backend SearchItems into view model MaterialGridItems
        // You can use the utilities.downloadImage(url: ...) to download the image
        // Please use the following code to get the url to the thumbnail
        // let url = item.thumbUrl.replacingOccurrences(of: "$1.png", with: ".png")
        return []
    }
    
    private func showMainViewController(_ items: [MaterialGridItem]) {
        let gridViewController = MaterialsGridCollectionViewController()
        gridViewController.items = items
        gridViewController.delegate = self
        
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        
        setViewControllers([gridViewController], animated: false)
    }
    
    private func showError(_ error: Error?) {
        
    }
}

extension ViewController : MaterialsGridCollectionViewControllerDelegate {
    func materialGrid(_ viewController: MaterialsGridCollectionViewController, itemSelected item: MaterialGridItem) {
        let detailViewController = MaterialDetailViewController()
        detailViewController.item = item

        show(detailViewController, sender: self)
    }
}
