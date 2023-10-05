//
//  OnBoardingContainerViewController.swift
//  Bankey
//
//  Created by Rama Muhammad S on 27/09/23.
//

import UIKit

protocol OnBoardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

protocol OnBoardingChangedPageDelegate: AnyObject{
    func didChangePage(index: Int, direction: UIPageViewController.NavigationDirection)
}
    
class OnBoardingContainerViewController: UIViewController{
    
    let pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageViewController
    }()
    
    var pages = [UIViewController]()
    var currentVC = UIViewController()
    
    let closeButton = UIButton(type: .system)
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let backButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    
    private var currentIndex = 0
    
    weak var delegate: OnBoardingContainerViewControllerDelegate?
    weak var didChangeDelegate: OnBoardingChangedPageDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let listData = ["delorean" : "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.", "world" : "Move your money around the world quickly and securely.", "thumbs" : "Learn more at www.bankey.com"]
        
        for (image, title) in listData{
            pages.append(OnBoardingViewController(imageName: image, labelDesc: title))
        }
        
        currentVC = pages.first ?? UIViewController()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
}

extension OnBoardingContainerViewController{
    
    private func setup(){
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubview(closeButton)
        view.addSubview(stackView)
        pageViewController.didMove(toParent: self)

        pageViewController.dataSource = self
        pageViewController.delegate = self
        didChangeDelegate = self
                
        for view in [backButton, nextButton]{
            stackView.addArrangedSubview(view)
        }
        
        backButton.layer.opacity = 0.0
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first ?? UIViewController()], direction: .forward, animated: true)
        currentVC = pages.first ?? UIViewController()
    }
    
    private func style(){
        for view in [pageViewController.view, stackView, closeButton, backButton, nextButton]{
            view!.translatesAutoresizingMaskIntoConstraints = false
        }
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 5)
        ])
    }
}

extension OnBoardingContainerViewController{
    @objc private func closeTapped(_ sender: UIButton){
        delegate?.didFinishOnboarding()
    }
    
    @objc private func backTapped(_ sender: UIButton){
        if currentIndex > 0 {
            currentIndex -= 1
            didChangeDelegate?.didChangePage(index: currentIndex, direction: .reverse)
        }
    }
    
    @objc private func nextTapped(_ sender: UIButton){
        if currentIndex < pages.count - 1{
            currentIndex += 1
            didChangeDelegate?.didChangePage(index: currentIndex, direction: .forward)
        }else if currentIndex == pages.count - 1{
            delegate?.didFinishOnboarding()
        }
    }
}

extension OnBoardingContainerViewController: OnBoardingChangedPageDelegate{
    func didChangePage(index: Int, direction: UIPageViewController.NavigationDirection) {
        backButton.alpha = index > 0 ? 1.0 : 0.0
        currentIndex = index
        
        if index == pages.count - 1{
            nextButton.setTitle("Done", for: [])
        }else{
            nextButton.setTitle("Next", for: [])
        }
        
        pageViewController.setViewControllers([pages[index]], direction: direction, animated: true)
    }
}

extension OnBoardingContainerViewController: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let index = pages.firstIndex(of: pageViewController.viewControllers![0])
        if completed{
            didChangeDelegate?.didChangePage(index: index!, direction: .forward)
        }
    }
}

extension OnBoardingContainerViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(to: viewController)
    }
    
    private func getNextViewController(to viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else {return nil}
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else {return nil}
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
}
