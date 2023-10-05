import SwiftGodot

public extension PackedScene {
    func instantiate<T: Node>() -> T {
        instantiate() as! T
    }
}
