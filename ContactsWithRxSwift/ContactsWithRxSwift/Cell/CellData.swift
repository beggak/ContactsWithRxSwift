import UIKit

open class CellData {
    public var title: String
    public var subtitle: String
    public var subtitles: [String]
    
    init(title: String, subtitle: String = "", subtitles: [String] = []) {
        self.title = title
        self.subtitle = subtitle
        self.subtitles = subtitles
    }
}
