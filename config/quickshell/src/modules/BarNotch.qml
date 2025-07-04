import QtQuick.Shapes
import QtQuick

Shape {
    required property Item bar

    anchors.fill: parent
    preferredRendererType: Shape.CurveRenderer

    ShapePath {
        id: path

        property double r: bar.height / 2

        fillColor: Colors.background
        strokeColor: "transparent"
        startX: bar.x - r
        startY: 0

        PathArc { x: bar.x; y: path.r; radiusX: path.r; radiusY: path.r }
        PathLine { x: bar.x + bar.width; y: path.r }
        PathArc { x: bar.x + bar.width + path.r; y: 0; radiusX: path.r; radiusY: path.r }
    }
}
