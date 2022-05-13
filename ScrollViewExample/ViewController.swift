//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by alanturker on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrolliew = ScrollViewMine()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(scrolliew)
        scrolliew.frame = view.bounds
        scrolliew.contentSize = CGSize(width: view.frame.size.width, height: 1200)
        scrolliew.cyanButtonCompletionBlock = { [weak self] in
            guard let self = self else { return }
            self.scrolliew.makeScrollViewToBottom()
            self.scrolliew.showToast("we  fuckn did it")
        }
    }
    
    

}

