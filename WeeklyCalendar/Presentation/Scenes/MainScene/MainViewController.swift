//
//  ViewController.swift
//  WeeklyCalendar
//
//  Created by Ladolado3911 on 07.10.21.
//

import UIKit

class MainViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onOpenCalendar(_ sender: Any) {
        let sb = UIStoryboard(name: "Calendar", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CalendarViewController")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

