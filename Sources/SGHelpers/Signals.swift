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

extension PropInfo {
    init(
        propertyType: (some VariantConvertible).Type,
        propertyName: StringName
    ) {
        self.init(
            propertyType: propertyType.gType,
            propertyName: propertyName,
            className: propertyType.gType == .object ? .init(String(describing: propertyType.self)) : .init(""),
            hint: .none,
            hintStr: "",
            usage: .default
        )
    }
}

public struct SignalWith1Argument<Argument: VariantConvertible> {
    let name: StringName

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        argumentName: String? = nil,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        let className = String(describing: classType)

        let arguments = [
            PropInfo(propertyType: Argument.self, propertyName: .init(argumentName ?? "arg1")),
        ]

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

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        argument1Name: String? = nil,
        argument2Name: String? = nil,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        let className = String(describing: classType)

        let arguments = [
            PropInfo(propertyType: Argument1.self, propertyName: .init(argument1Name ?? "arg1")),
            PropInfo(propertyType: Argument2.self, propertyName: .init(argument2Name ?? "arg2")),
        ]

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

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        argument1Name: String? = nil,
        argument2Name: String? = nil,
        argument3Name: String? = nil,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        let className = String(describing: classType)

        let arguments = [
            PropInfo(propertyType: Argument1.self, propertyName: .init(argument1Name ?? "arg1")),
            PropInfo(propertyType: Argument2.self, propertyName: .init(argument2Name ?? "arg2")),
            PropInfo(propertyType: Argument3.self, propertyName: .init(argument3Name ?? "arg3")),
        ]

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

    public init<Source: SwiftGodot.Object>(
        _ signalName: String,
        argument1Name: String? = nil,
        argument2Name: String? = nil,
        argument3Name: String? = nil,
        argument4Name: String? = nil,
        classType: Source.Type
    ) {
        name = StringName(signalName)
        let className = String(describing: classType)

        let arguments = [
            PropInfo(propertyType: Argument1.self, propertyName: .init(argument1Name ?? "arg1")),
            PropInfo(propertyType: Argument2.self, propertyName: .init(argument2Name ?? "arg2")),
            PropInfo(propertyType: Argument3.self, propertyName: .init(argument3Name ?? "arg3")),
            PropInfo(propertyType: Argument4.self, propertyName: .init(argument4Name ?? "arg4")),
        ]

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
