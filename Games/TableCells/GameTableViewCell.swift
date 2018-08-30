//
//  GameTableViewCell.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var gameCoverImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel! {
        didSet {
            self.gameNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
    @IBOutlet weak var gameYearLabel: UILabel! {
        didSet {
            self.gameYearLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func setUpCell(game: Game) {
        self.gameNameLabel.text = game.name
        self.gameYearLabel.text = game.releaseDate
        if let image = game.image {
            self.gameCoverImageView.image = image
        } else {
            self.gameCoverImageView.image = nil
        }
    }
}
