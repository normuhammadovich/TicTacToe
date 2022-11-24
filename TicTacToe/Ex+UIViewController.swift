//
//  Ex+UIViewController.swift
//  TicTacToe
//
//  Created by Chingiz Jumanov on 25/11/22.
//

import UIKit


extension UIViewController {
    ///Open viewcontroller
    func openMainVC() {
        let viewController = LoginVC(nibName: "LoginVC", bundle: nil)
          viewController.modalPresentationStyle = .fullScreen
          self.present(viewController, animated: true, completion: nil)
     }
}
