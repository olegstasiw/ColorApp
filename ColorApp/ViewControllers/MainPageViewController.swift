//
//  MainPageViewController.swift
//  ColorApp
//
//  Created by mac on 06.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit



class MainPageViewController: UIViewController {

//MARK: - Private methods
    private func setColorFromMainPage(_ index: Int) -> CGFloat {
        view.backgroundColor?.cgColor.components?[index] ?? 0
    }
//MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.99,
                                       green: 0.34,
                                       blue: 0.34,
                                       alpha: 1)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorAppVC = segue.destination as? ColorAppViewController
        colorAppVC?.redColorValue = setColorFromMainPage(0)
        colorAppVC?.greenColoValue = setColorFromMainPage(1)
        colorAppVC?.blueColorValue = setColorFromMainPage(2)
        colorAppVC?.delegate = self
    }
}

//MARK: - DELEGATE
extension MainPageViewController: MainPageViewControllerDelegate {
    func saveColor(color: UIColor) {
        view.backgroundColor = UIColor(red: CGFloat(color.cgColor.components?[0] ?? 0),
                                       green: CGFloat(color.cgColor.components?[1] ?? 0),
                                       blue: CGFloat(color.cgColor.components?[2] ?? 0),
                                       alpha: 1)
    }

    
}
