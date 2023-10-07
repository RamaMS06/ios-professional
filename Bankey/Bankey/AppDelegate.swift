//
//  AppDelegate.swift
//  Bankey
//
//  Created by Rama Muhammad S on 26/09/23.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onBoardingContainerViewController = OnBoardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = .init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onBoardingContainerViewController.delegate = self
        
        displayLogin()
        return true
    }
    
    private func displayLogin(){
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen(){
        setRootViewController(LocalState.hasOnboarded ? mainViewController: onBoardingContainerViewController)
    }
    
    private func prepMainView(){
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}

extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCurlUp, animations: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        prepMainView()
        displayNextScreen()
    }
}

extension AppDelegate: OnBoardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: LogoutDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
