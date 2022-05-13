//
//  ScrollView.swift
//  ScrollViewExample
//
//  Created by alanturker on 13.05.2022.
//

import Foundation
import UIKit

class ScrollViewMine: UIScrollView {
    
    var cyanButtonCompletionBlock: (() -> Void)?

    private let button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        button.addTarget(self, action: #selector(didTappedUpButton), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 200, width: 100, height: 100)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(didTappedBottomButton), for: .touchUpInside)
        button.setTitle("add green view", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private let viewGreen: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 40, y: 500, width: 250, height: 250)
        return view
    }()
    
    private let buttonInGreen: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 150, width: 100, height: 50)
        button.addTarget(self, action: #selector(didTappedCyanButton), for: .touchUpInside)
        button.backgroundColor = .cyan
        button.addCorners(corners: [.bottomLeft, .topLeft], radius: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.addSubview(button)
        self.addSubview(bottomButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTappedBottomButton() {
        self.addSubview(viewGreen)
        self.viewGreen.addSubview(buttonInGreen)
    }
    
    @objc func didTappedUpButton() {
        viewGreen.removeFromSuperview()
    }
    
    @objc func didTappedCyanButton() {
        if let block = self.cyanButtonCompletionBlock {
            block()
        }
    }
    
    func makeScrollViewToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}
