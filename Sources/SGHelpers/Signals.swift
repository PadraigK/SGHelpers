import SwiftGodot

public struct SignalWithNoArguments {
    let name: StringName

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        let className = String(describing: classType)

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: []
        )
    }
}

public struct SignalWith1Argument<Argument: VariantConvertible> {
    let name: StringName
    let argumentType: Argument.Type?

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        argumentType = Argument.self
        let className = String(describing: classType)

        let arguments = [argumentType]
            .map {
                String(describing: $0)
            }
            .map {
                PropInfo(
                    propertyType: .object,
                    propertyName: StringName($0),
                    className: StringName(className),
                    hint: .objectId,
                    hintStr: GString($0),
                    usage: .default
                )
            }

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: arguments
        )
    }
}

public struct SignalWith2Arguments<
    Argument1: VariantConvertible,
    Argument2: VariantConvertible
> {
    let name: StringName
    let argument1Type: Argument1.Type
    let argument2Type: Argument2.Type

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        argument1Type = Argument1.self
        argument2Type = Argument2.self
        let className = String(describing: classType)
        let arguments = [argument1Type, argument2Type]
            .map {
                String(describing: $0)
            }
            .map {
                PropInfo(
                    propertyType: .object,
                    propertyName: StringName($0),
                    className: StringName(className),
                    hint: .objectId,
                    hintStr: GString($0),
                    usage: .default
                )
            }

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: arguments
        )
    }
}

public struct SignalWith3Arguments<
    Argument1: VariantConvertible,
    Argument2: VariantConvertible,
    Argument3: VariantConvertible
> {
    let name: StringName
    let argument1Type: Argument1.Type
    let argument2Type: Argument2.Type
    let argument3Type: Argument3.Type

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        argument1Type = Argument1.self
        argument2Type = Argument2.self
        argument3Type = Argument3.self
        let className = String(describing: classType)

        let arguments = [argument1Type, argument2Type, argument3Type]
            .map {
                String(describing: $0)
            }
            .map {
                PropInfo(
                    propertyType: .object,
                    propertyName: StringName($0),
                    className: StringName(className),
                    hint: .objectId,
                    hintStr: GString($0),
                    usage: .default
                )
            }

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: arguments
        )
    }
}

public struct SignalWith4Arguments<
    Argument1: VariantConvertible,
    Argument2: VariantConvertible,
    Argument3: VariantConvertible,
    Argument4: VariantConvertible
> {
    let name: StringName
    let argument1Type: Argument1.Type
    let argument2Type: Argument2.Type
    let argument3Type: Argument3.Type
    let argument4Type: Argument4.Type

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        argument1Type = Argument1.self
        argument2Type = Argument2.self
        argument3Type = Argument3.self
        argument4Type = Argument4.self
        let className = String(describing: classType)

        let arguments = [argument1Type, argument2Type, argument3Type, argument4Type]
            .map {
                String(describing: $0)
            }
            .map {
                PropInfo(
                    propertyType: .object,
                    propertyName: StringName($0),
                    className: StringName(className),
                    hint: .objectId,
                    hintStr: GString($0),
                    usage: .default
                )
            }

        ClassInfo<Source>(name: StringName(className)).registerSignal(
            name: name,
            arguments: arguments
        )
    }
}

public extension Object {
    @discardableResult
    func emit(signal: SignalWithNoArguments) -> GodotError {
        emitSignal(signal.name)
    }

    @discardableResult
    func connect(signal: SignalWithNoArguments, to target: some Object, method: String) -> GodotError {
        connect(signal: signal.name, callable: .init(object: target, method: .init(method)))
    }

    @discardableResult
    func emit<A: VariantConvertible>(signal: SignalWith1Argument<A>, _ argument: A) -> GodotError {
        emitSignal(signal.name, argument.toVariant())
    }

    @discardableResult
    func connect(signal: SignalWith1Argument<some Any>, to target: some Object, method: String) -> GodotError {
        connect(signal: signal.name, callable: .init(object: target, method: .init(method)))
    }

    @discardableResult
    func emit<A: VariantConvertible, B: VariantConvertible>(
        signal: SignalWith2Arguments<A, B>,
        _ argument1: A,
        _ argument2: B
    ) -> GodotError {
        emitSignal(signal.name, argument1.toVariant(), argument2.toVariant())
    }

    @discardableResult
    func connect(signal: SignalWith2Arguments<some Any, some Any>, to target: some Object, method: String) -> GodotError {
        // GD.print("connecting \(self) -> \(signal.name.description) to \(method.name.description) on \(description)")
        connect(signal: signal.name, callable: .init(object: target, method: .init(method)))
    }

    @discardableResult
    func emit<A: VariantConvertible, B: VariantConvertible, C: VariantConvertible>(
        signal: SignalWith3Arguments<A, B, C>,
        _ argument1: A,
        _ argument2: B,
        _ argument3: C
    ) -> GodotError {
        emitSignal(signal.name, argument1.toVariant(), argument2.toVariant(), argument3.toVariant())
    }

    @discardableResult
    func connect(
        signal: SignalWith3Arguments<some Any, some Any, some Any>,
        to target: some Object,
        method: String
    ) -> GodotError {
        connect(signal: signal.name, callable: .init(object: target, method: .init(method)))
    }

    @discardableResult
    func emit<A: VariantConvertible, B: VariantConvertible, C: VariantConvertible, D: VariantConvertible>(
        signal: SignalWith4Arguments<A, B, C, D>,
        _ argument1: A,
        _ argument2: B,
        _ argument3: C,
        _ argument4: D
    ) -> GodotError {
        emitSignal(
            signal.name,
            argument1.toVariant(),
            argument2.toVariant(),
            argument3.toVariant(),
            argument4.toVariant()
        )
    }

    @discardableResult
    func connect(
        signal: SignalWith4Arguments<some Any, some Any, some Any, some Any>,
        to target: some Object,
        method: String
    ) -> GodotError {
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
