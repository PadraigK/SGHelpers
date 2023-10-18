import SwiftGodot

// Hopefully we can code-gen this some time

public protocol VariantConvertible {
    func toVariant() -> Variant
    static var gType: Variant.GType { get }
}

extension Object: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .object }
}

extension String: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .string }
}

extension Int: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .int }
}

extension Bool: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .bool }
}

extension Double: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .float } // 😓 this is what  `init (_ value: Double)` does though
}

extension Vector2: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
    public static var gType: Variant.GType { .vector2 }
}
