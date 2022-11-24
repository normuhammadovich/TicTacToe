//
//  LoginVC.swift
//  TicTacToe
//
//  Created by Chingiz Jumanov on 25/11/22.
//

import UIKit
import Lottie
class LoginVC: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var firstTf: UITextField!
    
    @IBOutlet weak var secondTf: UITextField!
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpLoginVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTicTacAnimation()
    }
    
    
    @IBAction func startTapped(_ sender: UIButton) {
        
        if firstTf.text!.isEmpty || secondTf.text!.isEmpty {
            setAlert()
        } else {
            cache.set(firstTf.text, forKey: "FIRSTPLAYER")
            cache.set(firstTf.text, forKey: "SECONDPLAYER")
            setUpLoadingAnimation()
            
        }
        
        
    }
    
    

}


//MARK: - setUpLoginVC
extension LoginVC {
    
    ///set up views, btns, tfs
    func setUpLoginVC() {
        blurView.clipsToBounds = true
        blurView.addShadow(cornerRadius: 16, shadowColor: .darkGray)
        firstTf.addShadow()
        secondTf.addShadow()
        startBtn.addShadow(cornerRadius: 16, shadowColor: .darkGray)
        
    }
}

//MARK: - Set Animations
extension LoginVC {
    
    func setTicTacAnimation() {
        animationView.animation = LottieAnimation.named("tictactoe")
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .autoReverse
        animationView.play()

    }
}


//MARK: - Set Alert
extension LoginVC {
    func setAlert() {
        let alertVC = UIAlertController(title: "Please enter your name!", message: "If you do not enter your name, you will not be able to enter the game! Therefore, enter your name!", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(okBtn)
        self.present(alertVC, animated: true)
    }
}


extension LoginVC {
    func setUpLoadingAnimation() {
        let loadingAnimV = LottieAnimationView()
        loadingAnimV.animation = LottieAnimation.named("pacmanloading")
        loadingAnimV.frame = view.bounds
        loadingAnimV.backgroundColor = .clear
        loadingAnimV.contentMode = .scaleAspectFit
        loadingAnimV.loopMode = .loop
        view.addSubview(loadingAnimV)
        loadingAnimV.play()
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            loadingAnimV.alpha = 0
            let vc = GameVC(nibName: "GameVC", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
