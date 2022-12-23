//
//  CollectionViewController.swift
//  Graphs
//
//  Created by fmss on 21.12.2022.
//

import UIKit

struct CellItem {
    let name: String
    let image: UIImage
    let backgroundColor: UIColor
    let storyboardId: StoryBoardId
}

enum StoryBoardId: String {
    case joystick = "JoystickViewController"
    case whell = "SettingsViewController"
    case coin = "CoinFlipViewController"
    case dice = "DiceRollViewController"
}

var cellItems: [CellItem] = [
    .init(name: "Random 2vs2",
          image: UIImage(named: "gamepad")!,
          backgroundColor: .systemPink,
          storyboardId: .joystick),
    .init(name: "Wheel of Fortune",
          image: UIImage(named: "wheel")!,
          backgroundColor: .systemTeal,
          storyboardId: .whell),
    .init(name: "Toss a Coin",
          image: UIImage(named: "coin-1")!,
          backgroundColor: .systemPurple,
          storyboardId: .coin),
    .init(name: "Dice Roll",
          image: UIImage(named: "dices")!,
          backgroundColor: .systemGreen,
          storyboardId: .dice)
]

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(.init(nibName: CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
    }   
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let targetVC = cellItems[indexPath.row].storyboardId
        
        var vc: UIViewController!
        
        switch targetVC {
        case .joystick:
            vc = storyboard?.instantiateViewController(withIdentifier: targetVC.rawValue) as! JoystickViewController
        case .whell:
            vc = storyboard?.instantiateViewController(withIdentifier: targetVC.rawValue) as! SettingsViewController
        case .coin:
            vc = storyboard?.instantiateViewController(withIdentifier: targetVC.rawValue) as! CoinFlipViewController
        case .dice:
            vc = storyboard?.instantiateViewController(withIdentifier: targetVC.rawValue) as! DiceRollViewController
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let item = cellItems[indexPath.row]
        
        cell.configureCell(using: item)
        
        return cell
        
    }
}

// MARK: - Collection View Delegete Flow Layout Methods
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2 - 10
        let height = self.collectionView.frame.height/2 - 30
        
        return CGSize(width: width, height: height)
    }
}

