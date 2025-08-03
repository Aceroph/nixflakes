import QtQuick.Shapes
import QtQuick

Shape {
    required property Item item
    property real r: item.height
    property int p: 5

    preferredRendererType: Shape.CurveRenderer

    ShapePath {
        id: path

        fillColor: Colors.background
        strokeColor: Colors.primary_muted
        strokeWidth: 2
        startX: item.x - r
        startY: 0

        PathCubic {
            x: item.x; y: item.y + item.height + p
            relativeControl1X: p * 3; relativeControl1Y: p
            relativeControl2X: p; relativeControl2Y: r + p
        }
        PathLine {
            x: item.x + item.width; y: item.y + item.height + p
        }
        PathCubic {
            x: item.x + item.width + r; y: 0
            relativeControl1X: p * 3; relativeControl1Y: -p
            relativeControl2X: p; relativeControl2Y: -r - p
        }
    }
}
