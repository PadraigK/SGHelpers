import SwiftGodot

public extension CanvasItem {
    var shaderMaterial: ShaderMaterial? {
        material as? ShaderMaterial
    }
}
