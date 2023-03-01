//
//  ViewController.swift
//  ImageDownloder
//
//  Created by KimJaeYoun on 2023/03/01.
//

import UIKit

final class ImageDownloadViewController: UIViewController {
    
    private var imageViews = [ImageView]()
    private var stackView = UIStackView()
    private var allLoadButtons = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func setupImageViews() {
        let images = Images(count: 5)
        
        images.urls.forEach { url in
            let imageView = ImageView()
            imageView.imageURL = url
            
            imageViews.append(imageView)
        }
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: imageViews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
    }
    
    private func setupLoadButton() {
        allLoadButtons.translatesAutoresizingMaskIntoConstraints = false
        allLoadButtons.setTitle("All-Load Images", for: .normal)
        allLoadButtons.setTitleColor(.red, for: .normal)
        allLoadButtons.addTarget(self,
                                 action: #selector(didTapedAllLoadButton(_:)),
                                 for: .touchUpInside)
        
        view.addSubview(allLoadButtons)
    }
    
    @objc func didTapedAllLoadButton(_ sender: UIButton) {
        imageViews.forEach { imageView in
            imageView.reload()
        }
    }
    
    private func configureUI() {
        setupImageViews()
        setupStackView()
        setupLoadButton()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            allLoadButtons.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            allLoadButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
