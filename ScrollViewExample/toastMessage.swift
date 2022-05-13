//
//  toastMessage.swift
//  ScrollViewExample
//
//  Created by alanturker on 13.05.2022.
//

import UIKit

//class Toast: ViewController {
//    static let shared = Toast()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func showToast(message: String) {
//        let toastLabel = UILabel(frame: CGRect(x: (self.view.frame.width/2)-75, y: self.view.frame.height - 100, width: 150, height: 40))
//        toastLabel.textAlignment = .center
//        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastLabel.textColor = UIColor.white
//        toastLabel.text = message
//        toastLabel.alpha = 1
//        toastLabel.layer.cornerRadius = 10
//        toastLabel.clipsToBounds = true
//        self.view.addSubview(toastLabel)
//
//        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveEaseInOut) {
//            toastLabel.alpha = 0
//        } completion: { isCompleted in
//            toastLabel.removeFromSuperview()
//        }
//
//    }
//}

//class Toast {
//    static func show(message: String, controller: UIScrollView) {
//        let toastContainer = UIView(frame: CGRect())
//        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastContainer.alpha = 0.0
//        toastContainer.layer.cornerRadius = 25;
//        toastContainer.clipsToBounds  =  true
//
//        let toastLabel = UILabel(frame: CGRect())
//        toastLabel.textColor = UIColor.white
//        toastLabel.textAlignment = .center;
//        toastLabel.font.withSize(12.0)
//        toastLabel.text = message
//        toastLabel.clipsToBounds  =  true
//        toastLabel.numberOfLines = 0
//
//        toastContainer.addSubview(toastLabel)
//        controller.addSubview(toastContainer)
//
//        toastLabel.translatesAutoresizingMaskIntoConstraints = false
//        toastContainer.translatesAutoresizingMaskIntoConstraints = false
//
//        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
//        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
//        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
//        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
//        toastContainer.addConstraints([a1, a2, a3, a4]
//
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
//            toastContainer.alpha = 1.0
//        }, completion: { _ in
//            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
//                toastContainer.alpha = 0.0
//            }, completion: {_ in
//                toastContainer.removeFromSuperview()
//            })
//        })
//    }
//}

class ToastLabel: UILabel {
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)

        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

extension UIScrollView {
    static let DELAY_SHORT = 1.5
    static let DELAY_LONG = 3.0

    func showToast(_ text: String, delay: TimeInterval = DELAY_LONG) {
        let label = ToastLabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.5)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.alpha = 0
        label.text = text
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.numberOfLines = 0
        label.textInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        let saveArea = self.safeAreaLayoutGuide
        label.centerXAnchor.constraint(equalTo: saveArea.centerXAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(greaterThanOrEqualTo: saveArea.leadingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(lessThanOrEqualTo: saveArea.trailingAnchor, constant: -15).isActive = true
        label.bottomAnchor.constraint(equalTo: saveArea.bottomAnchor, constant: -30).isActive = true

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            label.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseOut, animations: {
                label.alpha = 0
            }, completion: {_ in
                label.removeFromSuperview()
            })
        })
    }
}
