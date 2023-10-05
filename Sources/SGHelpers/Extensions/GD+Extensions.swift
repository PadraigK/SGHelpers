import SwiftGodot

public extension GD {
    static func load<T: Resource>(path: String) -> T {
        load(path: path) as! T
    }
}
