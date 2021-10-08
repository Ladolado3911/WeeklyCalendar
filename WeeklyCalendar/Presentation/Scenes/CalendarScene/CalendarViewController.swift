//
//  CalendarViewController.swift
//  WeeklyCalendar
//
//  Created by Ladolado3911 on 08.10.21.
//

import UIKit
import CalendarKit

class CalendarViewController: UIViewController {
    
    lazy var grayView: UIView = {
        let frame = view.bounds
        let grayView = UIView(frame: frame)
        grayView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onBackgroundView))
        grayView.addGestureRecognizer(tapGesture)
        return grayView
    }()
    
    lazy var mainView: UIView = {
       let frame = CGRect(x: view.bounds.width / 2,
                          y: view.bounds.height / 2,
                          width: 0,
                          height: 0)
        
        let mainView = UIView(frame: frame)
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 20
        
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addItems()
    }

    func addItems() {
        view.addSubview(grayView)
        view.addSubview(mainView)
        let finalFrame = CGRect(x: view.bounds.width * 0.1,
                                y: view.bounds.height * 0.1,
                                width: view.bounds.width * 0.8,
                                height: view.bounds.height * 0.8)
        
        animateAppearance(of: mainView, finalFrame: finalFrame)
    }
    
    func animateAppearance(of view: UIView, finalFrame: CGRect) {
        UIView.animate(withDuration: 1) {
            view.frame = finalFrame
        }
    }
    
    func animateAppearance(of view: UIView, finalFrame: CGRect, didFinish: @escaping () -> Void) {
        UIView.animate(withDuration: 1) {
            view.frame = finalFrame
        } completion: { finishedAnimating in
            if finishedAnimating {
                didFinish()
            }
        }
    }
    
    @objc func onBackgroundView(sender: UITapGestureRecognizer) {
        let finalFrame = CGRect(x: view.bounds.width / 2,
                                y: view.bounds.height / 2,
                                width: 0,
                                height: 0)
        animateAppearance(of: mainView, finalFrame: finalFrame) {
            self.grayView.isHidden = true
            self.dismiss(animated: true)
        }
    }
}
