//
//  AuthView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import UIKit
import SteamLogin
import SnapKit
import Lottie

class AuthView: UIViewController {
    
    private var steamButton = UIButton()
    private var steamLogoView = LottieAnimationView()
    
    var output: AuthViewOutput?
    
    override func viewDidAppear(_ animated: Bool) {
//        output?.getSteamUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func debugLog(_ user: SteamUser) {
        print("SteamID32: - ", user.steamID32 ?? "Wrong ID")
    }
    
    func showErrorAlert(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension AuthView {
    func setupUI() {
        self.view.backgroundColor = .white
        setupSteamLogo()
    }
    
    func setupButton() {
        
    }
    
    func setupSteamLogo() {
        steamLogoView = LottieAnimationView(name: "steam")
        steamLogoView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(steamLogoView)
        
        steamLogoView.play()
        steamLogoView.loopMode = .loop
        
        steamLogoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
}

extension AuthView: AuthViewInput {
    func performUser(steamUser: SteamUser?) {
        if steamUser != nil {
            SteamLoginVC.login(from: self) { [weak self] (user, error) in
                guard let self = self else { return }
                if let user = user {
                    user.save()
                    debugLog(user)
                } else {
                    self.showErrorAlert(error)
                }
            }
        } else {
            debugLog(steamUser!)
        }
    }
}


