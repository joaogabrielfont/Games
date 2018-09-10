//
//  GamesViewController.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var gamesTableView: UITableView! {
        didSet {
            self.gamesTableView.isHidden = true
            self.gamesTableView.register(GameTableViewCell.self, forCellReuseIdentifier: String(describing: GameTableViewCell.self))
            self.gamesTableView.register(UINib(nibName: String(describing: GameTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GameTableViewCell.self))
            self.gamesTableView.delegate = self
            self.gamesTableView.dataSource = self
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet{
            self.activityIndicator.hidesWhenStopped = true
        }
    }
    
    // MARK: - Variables
    var games: [Game] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Meus Games"
        NotificationCenter.default.addObserver(self, selector: #selector(gamesDownloaded(notification:)), name:.GamesDownloaded, object: nil)
        self.activityIndicator.startAnimating()
        OnlineService.getGames { (gamesArray) in
            self.games = gamesArray
            NotificationCenter.default.post(Notification(name: .GamesDownloaded))
        }
        NotificationCenter.default.addObserver(self, selector: #selector(gameImageDownloaded(notification:)), name: .GameImageDownloaded, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    @objc func gameImageDownloaded(notification: Notification) {
        guard let userInfo = notification.userInfo, let gameId = userInfo[NotificationKeys.gameId] as? Int else {
            return
        }
        if let index = self.games.index(where: { (game) -> Bool in return game.id == gameId }) {
            self.gamesTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
    
    @objc func gamesDownloaded(notification: Notification) {
        self.gamesTableView.isHidden = false
        self.activityIndicator.stopAnimating()
        self.gamesTableView.reloadData()
    }
}

//MARK: - TableView DataSource
extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = gamesTableView.dequeueReusableCell(withIdentifier: String(describing: GameTableViewCell.self), for: indexPath) as? GameTableViewCell {
            cell.setUpCell(game: self.games[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - TableView Delegate
extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "GameDetailViewController") as? GameDetailViewController{
            vc.game = self.games[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
