

import UIKit

class EventProfileViewModel: NSObject {

    public func convertURLImage(url: String) -> UIImage? {
        let imageURL = URL(string: url)!

        guard let imageData = try? Data(contentsOf: imageURL) else {
            return UIImage(named: "placeholder-image.png") }
        let image = UIImage(data: imageData)
        return image
    }

    
}
