import QtQuick.Shapes
import QtQuick

Shape {
    id: root

    property alias self: root.parent

    property var color: "white"
    property var borderColor: "black"
    property int border: 2

    property int maxRadius: 20
    property real radius: Math.min(self.height / 2, maxRadius)
    property int maxRadiusTop: maxRadius
    property real radiusTop: Math.min(self.height / 2, maxRadiusTop)
    property int maxRadiusTopLeft: maxRadiusTop
    property real radiusTopLeft: Math.min(self.height / 2, maxRadiusTopLeft)
    property int maxRadiusTopRight: maxRadiusTop
    property real radiusTopRight: Math.min(self.height / 2, maxRadiusTopRight)
    property int maxRadiusBottom: maxRadius
    property real radiusBottom: Math.min(self.height / 2, maxRadiusBottom)
    property int maxRadiusBottomLeft: maxRadiusBottom
    property real radiusBottomLeft: Math.min(self.height / 2, maxRadiusBottomLeft)
    property int maxRadiusBottomRight: maxRadiusBottom
    property real radiusBottomRight: Math.min(self.height / 2, maxRadiusBottomRight)

    preferredRendererType: Shape.CurveRenderer

    ShapePath {

        fillColor: color
        strokeColor: borderColor
        strokeWidth: border
        
        startX: self.x
        startY: 0

        PathArc {
            x: self.x + radiusTopLeft; y: radiusTopLeft
            radiusX: radiusTopLeft; radiusY: radiusTopLeft
        }
        PathLine {
            x: self.x + radiusTopLeft; y: self.height - radiusBottomLeft
        }
        PathArc {
            x: self.x + radiusBottomLeft * 3; y: self.height
            radiusX: radiusBottomLeft; radiusY: radiusBottomLeft
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: self.x + self.width - radiusBottomRight - radiusTopRight; y: self.height
        }
        PathArc {
            x: self.x + self.width - radiusTopRight; y: self.height - radiusBottomRight
            radiusX: radiusBottomRight; radiusY: radiusBottomRight
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: self.x + self.width - radiusTopRight; y: radiusTopRight
        }
        PathArc {
            x: self.x + self.width; y: 0
            radiusX: radiusTopRight; radiusY: radiusTopRight
        }
    }
}
