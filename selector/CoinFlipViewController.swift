//
//  ViewController.swift
//  selector
//
//  Created by fmss on 21.12.2022.
//

import UIKit

class CoinFlipViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imageView.image = UIImage(named: "coin")
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func flipClicked(_ sender: Any) {
        
        let num = Int.random(in: 1...2)
        
        if num == 1 {
            let gif = UIImage.gifImageWithName("heads")
            imageView.image = gif
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                self.imageView.image = UIImage(named: "headspic")
            }
        }
        else {
            let gif = UIImage.gifImageWithName("3")
            imageView.image = gif
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                self.imageView.image = UIImage(named: "tail")
            }
        }


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
    static func gifImageWithName(_ name: String) -> UIImage? {
        guard let path = Bundle.main.path(forResource: name, ofType: "gif") else {
            print("GIF dosyası bulunamadı.")
            return nil
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("GIF dosyası okunamadı.")
            return nil
        }
        
        return gifImageWithData(data)
    }
    
    static func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("GIF dosyası oluşturulamadı.")
            return nil
        }
        
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var durations = [Int]()
        
        for i in 0..<count {
            guard let image = CGImageSourceCreateImageAtIndex(source, i, nil) else {
                continue
            }
            
            if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                let gifInfo = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any] {
                let duration = gifInfo[kCGImagePropertyGIFDelayTime as String] as? Double ?? 0
                durations.append(Int(duration * 1000))
            } else {
                durations.append(100)
            }
            
            images.append(UIImage(cgImage: image))
        }
        
        return UIImage.animatedImage(with: images, duration: Double(durations.reduce(0, +)) / 1000)
    }
}
