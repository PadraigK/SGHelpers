import SwiftGodot

public protocol SceneInstantiable {
    static var resourcePath: String { get }
}

public extension SceneInstantiable where Self: Node {
    static func makeScene() -> Self {
        (GD.load(path: resourcePath) as! PackedScene).instantiate()
    }
}
