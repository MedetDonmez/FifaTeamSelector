//
//  CollectionViewCell.swift
//  Graphs
//
//  Created by fmss on 21.12.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.transform = CGAffineTransform(rotationAngle: -(.pi / 6))
        textLabel.transform = CGAffineTransform(rotationAngle: -(.pi / 72))
        
        cardView.layer.cornerRadius = 16
        cardView.clipsToBounds = true
        
        self.clipsToBounds = false
        
        // MARK: - doesn't work
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 10, height: 20)
        shadowView.layer.shadowRadius = 16
        shadowView.layer.shadowOpacity = 0.8
        
        textLabel.layer.shadowColor = UIColor.black.cgColor
        textLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        textLabel.layer.shadowRadius = 4
        textLabel.layer.shadowOpacity = 0.2
    }
    
    func configureCell(using cellItem: CellItem) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [cellItem.backgroundColor.darkerColor(by: 0.1)!.cgColor, cellItem.backgroundColor.lighterColor(by: 0.2)!.cgColor]
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: Int(cardView.bounds.width), height: Int(cardView.bounds.height) + 150)
        
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        
        cardView.layer.insertSublayer(gradientLayer, at: 0)
        
        let phoneSize = UIScreen.main.bounds.width
        let divider: CGFloat = phoneSize > 340 ? 2 : 3
        
        let imageSize = cardView.frame.width / divider
        imageViewWidth.constant = CGFloat(imageSize)
        imageViewHeight.constant = CGFloat(imageSize)
        
        textLabel.text = cellItem.name
        imageView.image = cellItem.image
    }

}
