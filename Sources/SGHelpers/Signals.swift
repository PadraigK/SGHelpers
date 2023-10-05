import SwiftGodot

public struct RegisteredSignal<Argument: VariantConvertible> {
    let name: StringName
    let argumentType: Argument.Type?

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        argumentType = Argument.self
        let className = String(describing: classType)

        let arguments: [PropInfo]
        if let argumentType {
            let argumentName = String(describing: argumentType)
            arguments =
                [
                    .init(
                        propertyType: .object,
                        propertyName: StringName(argumentName),
                        className: StringName(className),
                        hint: .objectId,
                        hintStr: GString(argumentName),
                        usage: .default
                    ),
                ]
        } else {
            arguments = []
        }

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: arguments
        )
    }
}

public extension Object {
    @discardableResult
    func emit<A: VariantConvertible>(signal: RegisteredSignal<A>, argument: A) -> GodotError {
        emitSignal(signal.name, argument.toVariant())
    }

    @discardableResult
    func emit(signal: RegisteredSignal<Never>) -> GodotError {
        emitSignal(signal.name)
    }

    @discardableResult
    func connect(signal: RegisteredSignal<some Any>, to target: some Object, method: String) -> GodotError {
        // GD.print("connecting \(self) -> \(signal.name.description) to \(method.name.description) on \(description)")
        connect(signal: signal.name, callable: .init(object: target, method: .init(method)))
    }
}

public protocol VariantConvertible {
    func toVariant() -> Variant
}

extension Object: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
}

extension String: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
}

extension Int: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
}

extension Bool: VariantConvertible {
    public func toVariant() -> Variant { .init(self) }
}

extension Never: VariantConvertible {
    public func toVariant() -> Variant { .init(nil) }
}
