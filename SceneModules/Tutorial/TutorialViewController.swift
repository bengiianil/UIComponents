//
//  TutorialViewController.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import Foundation
import UIKit

class TutorialViewController: BaseViewController<TutorialViewModel> {

    private var pageViewController: UIPageViewController!
    private var pageViewIndex = 0
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addPageViewController()
        setViewControllers()
    }
    
    private func addPageViewController() {

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setViewControllers() {
        pageViewController.setViewControllers([GenericImageContainerBuilder.build(with: viewModel.getItem(at: 0))], direction: .forward, animated: true, completion: nil)
        pageViewController.didMove(toParent: self)
    }
    
    private func getViewControllers(at index: Int) -> UIViewController {
        return GenericImageContainerBuilder.build(with: viewModel.getItem(at: index))
    }
}
extension TutorialViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let controller = viewController as? GenericImageContainerViewController else { return nil }
        
        var index = controller.viewModel.getPageIndex()
        if index == 0 { return nil }
        index -= 1

        return getViewControllers(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let controller = viewController as? GenericImageContainerViewController else { return nil }
        
        var index = controller.viewModel.getPageIndex()
        index += 1
        if index == 0 { return nil }
        
        return getViewControllers(at: index)
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewModel.getItemCount()
    }
}
