import UIKit
import SteamLogin
import SnapKit

class ViewController: UIViewController {
    var steamUser: SteamUser? = nil
    let containerView = UIView()
    let label = UILabel()
    override func viewDidAppear(_ animated: Bool) {
        SteamLogin.steamApiKey = "160A1E87653E30D9562DE9E5A47386E5"
        self.steamUser = SteamUser.load()
        if steamUser == nil {
            SteamLoginVC.login(from: self) { [weak self] (user, error) in
                guard let self = self else { return }
                if let user = user {
                    self.steamUser = user
                    self.steamUser?.save()
                    self.perform(#selector(self.showSuccessAlert), with: nil, afterDelay: 1)
                } else {
                    self.showErrorAlert(error)
                }
            }
        } else {
            self.perform(#selector(self.showSuccessAlert), with: nil, afterDelay: 1)
        }
        
        setupContainerView()
    }
    
    @objc func showSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Welcome \(steamUser?.steamVanityID ?? "").\n  Your steamID32 is : \(steamUser?.steamID32 ?? ""). \n Your steamID64 is : \(steamUser?.steamID64 ?? "").", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
    func setupContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .red
        containerView.snp.makeConstraints { make in
            make.height.equalTo(110)
            make.width.equalTo(100)
        }
        
    }
}

