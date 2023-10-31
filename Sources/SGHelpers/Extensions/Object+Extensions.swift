import SwiftGodot

public struct PropertyName {
    let rawValue: StringName
    public init(_ rawValue: StringName) {
        self.rawValue = rawValue
    }
}

public extension PropertyName {
    static let disabled = Self("disabled")
}

public extension Object {
    func setDeferred(property: PropertyName, value: some VariantStorable) {
        setDeferred(property: property.rawValue, value: Variant(value))
    }
}
