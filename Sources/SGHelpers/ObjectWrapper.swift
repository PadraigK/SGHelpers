import SwiftGodot

public struct ObjectWrapper<T: GodotObject> {
    public let object: T
    public init?(_ variant: Variant) {
        guard let unwrapped: T = variant.asObject() else {
            return nil
        }
        object = unwrapped
    }
}
