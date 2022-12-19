//
//  SpinViewController.swift
//  selector
//
//  Created by fmss on 16.12.2022.
//

import UIKit
import SwiftFortuneWheel


//var prizes = [(name: "MAN CITY", color: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), imageName: "joystick", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
//              (name: "MAN UNITED", color: #colorLiteral(red: 1, green: 0.5892302394, blue: 0.3198351264, alpha: 1), imageName: "graphIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "CHELSEA", color: #colorLiteral(red: 0.9898706079, green: 0.9671228528, blue: 0.4056283832, alpha: 1), imageName: "homeIcon", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
//              (name: "LIVERPOOL", color: #colorLiteral(red: 0.4118881524, green: 1, blue: 0.6970380545, alpha: 1), imageName: "ideaIcon", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
//              (name: "REAL MADRID", color: #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1), imageName: "managerIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "BARCELONA", color: #colorLiteral(red: 0.3287895918, green: 0.3738358617, blue: 0.8356924653, alpha: 1), imageName: "searchIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "INTER", color: #colorLiteral(red: 0.915895164, green: 0.5538236499, blue: 0.9093081355, alpha: 1), imageName: "targetIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "MILAN", color: #colorLiteral(red: 0.8828339577, green: 0.3921767175, blue: 0.4065475464, alpha: 1), imageName: "timeIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "ATLETICO MADRID", color: #colorLiteral(red: 0.3568204641, green: 0.3568871021, blue: 0.356816262, alpha: 1), imageName: "dollarIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "PSG", color: #colorLiteral(red: 1, green: 0.5892302394, blue: 0.3198351264, alpha: 1), imageName: "graphIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
//              (name: "ARSENAL", color: #colorLiteral(red: 0.9898706079, green: 0.9671228528, blue: 0.4056283832, alpha: 1), imageName: "homeIcon", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
//              (name: "TOTTENHAM", color: #colorLiteral(red: 0.4118881524, green: 1, blue: 0.6970380545, alpha: 1), imageName: "ideaIcon", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
//              (name: "BAYERN MUNIH", color: #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1), imageName: "managerIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]

class SpinViewController: UIViewController {
    var wheelItems = [Item]()
    var i = 0
    var colors = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1), #colorLiteral(red: 0, green: 0.9310292602, blue: 0.8295372128, alpha: 1), #colorLiteral(red: 0.7153585553, green: 0.6307420731, blue: 0.9355044961, alpha: 1), #colorLiteral(red: 0.1564418674, green: 0.6438430548, blue: 0.938908875, alpha: 1), #colorLiteral(red: 0.9355938435, green: 0.8070722818, blue: 0.3707980514, alpha: 1), #colorLiteral(red: 0.760209024, green: 0.9191901088, blue: 0.1548531353, alpha: 1), #colorLiteral(red: 0.7253844142, green: 0.5410823822, blue: 0.9392373562, alpha: 1), #colorLiteral(red: 0.9666156173, green: 0.5926267505, blue: 0.4015755653, alpha: 1), #colorLiteral(red: 0.9168447256, green: 0.4743626714, blue: 0.9386173487, alpha: 1), #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1)]
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var fortuneWheel: SwiftFortuneWheel! {
        didSet {
            fortuneWheel.configuration = .variousWheelPodiumConfiguration
            fortuneWheel.slices = slices
            fortuneWheel.spinImage = "darkBlueCenterImage"
            fortuneWheel.isSpinEnabled = false
        }
        
    }
    
    
    

    
    lazy var slices: [Slice] = {
        var slices: [Slice] = []
        for item in wheelItems {
            
            let sliceContent = [Slice.ContentType.assetImage(name: "", preferences: .variousWheelPodiumImage),
                                Slice.ContentType.text(text: item.title ?? "", preferences: .variousWheelPodiumText(textColor: .black))]
            var slice = Slice(contents: sliceContent, backgroundColor: colors[i%10])
            i += 1
            slices.append(slice)
        }
        return slices
    }()

    var finishIndex: Int {
        return Int.random(in: 0..<fortuneWheel.slices.count)
    }

    override func viewDidLoad() {
        spinButton.layer.cornerRadius = 8
        fortuneWheel.pinImageViewCollisionEffect = CollisionEffect(force: 10, angle: 20)
//        fortuneWheel.edgeCollisionDetectionOn = true
//        fortuneWheel.edgeCollisionSound = AudioFile(filename: "Click", extensionName: "mp3")
        fortuneWheel.centerCollisionDetectionOn = true
        fortuneWheel.centerCollisionSound = AudioFile(filename: "Tick", extensionName: "mp3")
        fortuneWheel.impactFeedbackOn = true
        fortuneWheel.edgeCollisionDetectionOn = true
//        fortuneWheel.onCenterCollision = { progress in
//               print("center collision progress: \(String(describing: progress))")
//        }
//        fortuneWheel.centerCollisionDetectionOn = true
        super.viewDidLoad()
    }
    
    @IBAction func rotateTap(_ sender: Any) {
        fortuneWheel.startRotationAnimation(finishIndex: finishIndex, continuousRotationTime: 1) { (finished) in
            print(finished)
        }
    }
}

public extension ImagePreferences {
    static var variousWheelPodiumImage: ImagePreferences {
        let imagePreferences = ImagePreferences(preferredSize: CGSize(width: 25, height: 25), verticalOffset: 5)
        return imagePreferences
    }
}

public extension TextPreferences {
    static func variousWheelPodiumText(textColor: UIColor) -> TextPreferences {

        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: textColor)
        
        var font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        var horizontalOffset: CGFloat = 0
        
        if let customFont = UIFont(name: "DINCondensed-Bold", size: 12) {
            font = customFont
            horizontalOffset = -2
        }
    
        var textPreferences = TextPreferences(textColorType: textColorType,
                                                 font: font,
                                                 verticalOffset: 5)
        
        textPreferences.horizontalOffset = horizontalOffset
        textPreferences.orientation = .vertical
        textPreferences.alignment = .right
        
        return textPreferences
    }
}

public extension SFWConfiguration {
    static var variousWheelPodiumConfiguration: SFWConfiguration {
        
        let spin = SFWConfiguration.SpinButtonPreferences(size: CGSize(width: 50, height: 50))
        
        let sliceColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .gray)
        
        let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceColorType, strokeWidth: 0, strokeColor: .white)
        
        let anchorImage = SFWConfiguration.AnchorImage(imageName: "anchorImage", size: CGSize(width: 8, height: 8), verticalOffset: -10)
        
        let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: 1, strokeColor: UIColor.init(red: 32/255, green: 93/255, blue: 97/255, alpha: 1))
        
        var wheelPreferences = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                                 slicePreferences: slicePreferences,
                                                                 startPosition: .right)
        
        wheelPreferences.imageAnchor = anchorImage
        
        
        let pin = SFWConfiguration.PinImageViewPreferences(size: CGSize(width: 30,height: 50), position: .top, verticalOffset: -40)

        let configuration = SFWConfiguration(wheelPreferences: wheelPreferences, pinPreferences: pin, spinButtonPreferences: spin)

        return configuration
    }
}

