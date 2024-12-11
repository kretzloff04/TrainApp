import UIKit
import Foundation

struct iPhoneModel{
    static func getIPhoneModelByScreen() -> String {
        let screenHeight = UIScreen.main.nativeBounds.height
        let screenWidth = UIScreen.main.nativeBounds.width

        let modelMapping: [(width: CGFloat, height: CGFloat, model: String)] = [
            (1080, 2340, "iPhone 12 Mini or iPhone 13 Mini"),
            (1170, 2532, "iPhone 12, iPhone 12 Pro, iPhone 13, or iPhone 13 Pro"),
            (1284, 2778, "iPhone 12 Pro Max or iPhone 13 Pro Max"),
            (1179, 2556, "iPhone 14 or iPhone 14 Pro"),
            (1290, 2796, "iPhone 14 Pro Max"),
            (1179, 2556, "iPhone 14 Plus"),
            
        ]
        
        for device in modelMapping {
            if screenHeight == device.height && screenWidth == device.width {
                return device.model
            }
        }
        
        return "Unknown iPhone Model"
    }

}
