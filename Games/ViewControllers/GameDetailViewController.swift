//
//  GameDetailViewController.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit
import YouTubePlayer

class GameDetailViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var gameCoverImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel! {
        didSet {
            self.gameNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
    @IBOutlet weak var gameReleaseLabel: UILabel! {
        didSet {
            self.gameReleaseLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    @IBOutlet weak var gamePlatformsLabel: UILabel! {
        didSet {
            self.gamePlatformsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    @IBOutlet weak var trailerVideoView: YouTubePlayerView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Variables
    weak var game: Game? = nil
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trailerVideoView.delegate = self
        if let game = self.game {
            self.gameCoverImageView.image = game.image
            self.gameNameLabel.text = game.name
            self.gameReleaseLabel.text = game.releaseDate
            self.gamePlatformsLabel.text = game.platforms.joined(separator: ", ")
            self.activityIndicator.startAnimating()
            if let trailer = self.getYoutubeId(youtubeUrl: game.trailer) {
                self.trailerVideoView.loadVideoID(trailer)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getYoutubeId(youtubeUrl: String) -> String? {
        return URLComponents(string: youtubeUrl)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
}

extension GameDetailViewController : YouTubePlayerDelegate {
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
}
