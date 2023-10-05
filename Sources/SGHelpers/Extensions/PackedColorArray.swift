import SwiftGodot

public extension PackedColorArray {
    convenience init(_ colors: [Color]) {
        self.init()

        for color in colors { append(value: color) }
    }
}
