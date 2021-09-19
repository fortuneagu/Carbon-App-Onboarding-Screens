//
//  ViewController.swift
//  Carbon
//
//  Created by Decagon on 8/23/21.
//

import UIKit
import Lottie

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set up new account", for: .normal)
        button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "carbon logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(didTapNextButton) , for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //    set up collection view
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    // set up collection view data
    
    let cellId = "cellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Go beyond banking", message: "Welcome to the future. Carbon is your passport to world-class financial services, built just for you.", imageName: "page 1")
        let secondPage  = Page(title: "Stay on top of your finances. Anytime. Anywhere", message: "Carbon makes financial services faster, cheaper and more convenient, you can access the app 24\\7, anywhere you are.", imageName: "page 2")
        let thirdPage  = Page(title: "Trusted by millions", message: "With carbon's market-leading service already used by millions of people just like you, you're in very good company.", imageName: "page 3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutSignupButton()
        layoutLogoView()
        //        navigationItem.setRightBarButton(UIBarButtonItem(customView: skipButton), animated: true)
        view.addSubview(collectionView)
        collectionView.anchorToTop(top: logo.bottomAnchor, left: view.leftAnchor, bottom: signupButton.topAnchor, right: view.rightAnchor)
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNextButton))
    }
    
    
    @objc func didTapNextButton(_ sender: UIButton) {
        // Move to the next screen
        let nextViewController = SignupPageViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc private func didTapLoginButton(_ sender: UIButton) {
        // Move to the next screen
        let nextViewController = LoginViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //    Add three pages to the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private func layoutSignupButton() {
        signupButton.layer.cornerRadius = 8
        view.addSubview(signupButton)
        
        // AutoLayout
        NSLayoutConstraint.activate([
            signupButton.heightAnchor.constraint(equalToConstant: 52),
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
        ])
    }
    
    private func layoutLogoView() {
        view.addSubview(logo)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logo.heightAnchor.constraint(equalToConstant: 60),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -100 )
        ])
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        
        if pageNumber == 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNextButton))
        }else{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign in", style: .plain, target: self, action: #selector(didTapLoginButton))
        }
    }
}
