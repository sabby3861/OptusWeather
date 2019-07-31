//
//  OPAlertViewController.swift
//  OptusWeather
//
//  Created by techm on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

protocol OPAlertDelegate {
    func alert(buttonClickedIndex:Int, buttonTitle: String, tag: Int)
}

class OPAlertViewController: NSObject {
    
    class func showAlert(withTitle title: String, message:String, buttons:[String] = ["Ok"], delegate: OPAlertDelegate? = nil, tag: Int = 0){
        
        var presentingViewController = UIApplication.shared.keyWindow?.rootViewController
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tag = tag
        var index = 0
        for button in buttons {
            let action =  UIAlertAction(title: button, style: .default, handler: { (alertAction) in
                
                if let d = delegate{
                    d.alert(buttonClickedIndex: index, buttonTitle: alertAction.title != nil ? alertAction.title! : "Optus", tag: tag)
                }
            })
            alert.addAction(action)
            index = index + 1
        }
        
        while presentingViewController?.presentedViewController != nil {
            presentingViewController = presentingViewController?.presentedViewController
        }
        
        presentingViewController?.present(alert, animated: true, completion: nil)
    }
}


class OPActivityView: NSObject{
    lazy var activityIndicator = UIActivityIndicatorView()
    lazy var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
  
    func showActivityIndicatory(view: UIView, _ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 220, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 220, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
    
    func removeActivity() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        strLabel.removeFromSuperview()
    }
}

