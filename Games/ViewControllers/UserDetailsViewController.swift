//
//  UserDetailsViewController.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            self.nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            self.nameLabel.isHidden = true
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            self.emailLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            self.emailLabel.isHidden = true
        }
    }
    @IBOutlet weak var birthdayLabel: UILabel! {
        didSet {
            self.birthdayLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            self.birthdayLabel.isHidden = true
        }
    }
    @IBOutlet weak var addressLabel: UILabel!{
        didSet {
            self.addressLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            self.addressLabel.isHidden = true
        }
    }
    @IBOutlet weak var cityLabel: UILabel! {
        didSet {
            self.cityLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            self.cityLabel.isHidden = true
        }
    }
    @IBOutlet weak var countryLabel: UILabel! {
        didSet {
            self.countryLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            self.countryLabel.isHidden = true
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    
    weak var user: User? = nil
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Meu Perfil"
        self.activityIndicator.startAnimating()
        OnlineService.getUser { (user) in
            self.user = user
            if let user = self.user {
                self.nameLabel.text = "\(user.name) \(user.lastName)"
                self.emailLabel.text = user.email
                self.birthdayLabel.text = user.birthday
                self.addressLabel.text = user.address
                self.cityLabel.text = user.city
                self.countryLabel.text = user.country
                self.activityIndicator.stopAnimating()
                self.showAllLabels()
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(userImageDownloaded(notification:)), name: .UserImageDownloaded, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Methods
    func showAllLabels() {
        self.nameLabel.isHidden = false
        self.emailLabel.isHidden = false
        self.birthdayLabel.isHidden = false
        self.addressLabel.isHidden = false
        self.cityLabel.isHidden = false
        self.countryLabel.isHidden = false
        self.activityIndicator.isHidden = true
    }
    @objc func userImageDownloaded(notification: Notification) {
        guard let userInfo = notification.userInfo, let email = userInfo[NotificationKeys.userEmail] as? String else {
            return
        }
        if email == self.user?.email {
            self.avatarImageView.image = self.user?.avatar
        }
    }
}
